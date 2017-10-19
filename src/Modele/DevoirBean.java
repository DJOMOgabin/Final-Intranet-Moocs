package Modele;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DevoirBean {

    public List<Devoir> getDevoirBD() {
        Connection conn;
        List<Devoir> ls = new ArrayList<Devoir>();
        try {
            conn = this.ouvrirBD();

            Statement stat = conn.createStatement();

            ResultSet rs = stat.executeQuery("select * from devoir");

            while (rs.next()) {
                Devoir d = new Devoir();
                d.setIdDevoir(rs.getInt("id_devoir"));
                d.setIdCours(rs.getInt("id_cours"));
                d.setEtat(rs.getString("etat"));
                d.setTypeDevoir(rs.getString("type_devoir"));
                ls.add(d);

            }

            rs.close();
            stat.close();
            conn.close();

        } catch (SQLException e) {
            System.out.println("Erreur : " + e.getMessage());
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ls;
    }

    public Integer getnombreParticipant(Integer idDevoir) {
        Connection conn;
        if (idDevoir == null) {
            return 0;
        }
        int nombre = 0;
        try {
            conn = this.ouvrirBD();

            Statement stat = conn.createStatement();

            ResultSet rs = stat.executeQuery("select count(id_etudiant) as nombre from devoir_etudiant where id_devoir=" + idDevoir);

            while (rs.next()) {
                nombre = rs.getInt("nombre");
                break;

            }

            rs.close();
            stat.close();
            conn.close();

        } catch (SQLException e) {
            System.out.println("Erreur : " + e.getMessage());
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return nombre;
    }

    public String getCode(Integer idDevoir) {
        String code = "[['Mension','Taux']";
        if (idDevoir == null) {
            return code + "]";
        }
        code = code + ",['Echec \\[0;5\\['," + getNombreDeNoteParIntervalle(idDevoir, 0, 5) + "]";
        code = code + ",['Echec \\[6;7\\['," + getNombreDeNoteParIntervalle(idDevoir, 5, 7) + "]";
        code = code + ",['Echec\\[7;10\\['," + getNombreDeNoteParIntervalle(idDevoir, 7, 10) + "]";
        code = code + ",['Passable \\[10;12\\['," + getNombreDeNoteParIntervalle(idDevoir, 10, 12) + "]";
        code = code + ",['Asséz bien \\[12;14\\['," + getNombreDeNoteParIntervalle(idDevoir, 12, 14) + "]";
        code = code + ",['Bien \\[14;16\\['," + getNombreDeNoteParIntervalle(idDevoir, 14, 16) + "]";
        code = code + ",['Trè bien \\[16;18\\['," + getNombreDeNoteParIntervalle(idDevoir, 16, 19) + "]";
        code = code + ",['Excellent \\[18;20\\]'," + getNombreDeNoteParIntervalle(idDevoir, 19, 21) + "]]";
        return code;
    }

    public int getNombreDeNoteParIntervalle(Integer idDevoir, Integer min, Integer max) {
        Connection conn;
        if (idDevoir == null || min == null || max == null) {
            return 0;
        }
        int nombre = 0;
        try {
            conn = this.ouvrirBD();

            Statement stat = conn.createStatement();

            ResultSet rs = stat.executeQuery("select count(id_etudiant) as nombre from devoir_etudiant where id_devoir=" + idDevoir + " and note>=" + min + " and note<" + max);

            while (rs.next()) {
                nombre = rs.getInt("nombre");
                break;

            }

            rs.close();
            stat.close();
            conn.close();

        } catch (SQLException e) {
            System.out.println("Erreur : " + e.getMessage());
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return nombre;
    }

    public String getHistogramme(String idDevoir) {
        Connection conn;

        String code = "[[\"id\",\"note\"]";
        if (idDevoir == null || idDevoir.isEmpty()) {
            return code + "]";
        }
        try {
            conn = this.ouvrirBD();

            Statement stat = conn.createStatement();

            ResultSet rs = stat.executeQuery("select id_etudiant  ,note  from devoir_etudiant where id_devoir=" + idDevoir);

            while (rs.next()) {
                code = code + "[\"" + rs.getString("id_etudiant") + "\"," + rs.getDouble("note") + "]";

            }
            code = code + "]";
            rs.close();
            stat.close();
            conn.close();

        } catch (SQLException e) {
            System.out.println("Erreur : " + e.getMessage());
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return code;
    }

    public String getTitreCercle(String idDevoir) {
        Connection conn;

        String code = "";
        if (idDevoir == null || idDevoir.isEmpty()) {
            return code;
        }
        try {
            conn = this.ouvrirBD();

            Statement stat = conn.createStatement();

            ResultSet rs = stat.executeQuery("select id_cours  ,date_echeance, type_devoir  from devoir where id_devoir=" + idDevoir);
            Integer idc = null;
            while (rs.next()) {
                code = code + "Intitulé :" + rs.getString("type_devoir") + "\nDate : " + getHeureActuelle(rs.getDate("date_echeance")) + "";
                idc = rs.getInt("id_cours");
            }

            rs.close();
            stat.close();
            conn.close();
            if (idc != null) {
                Cours c = new Cours();
                String s = c.getTitreCoursID(idc) + "";
                if (s != null && !s.isEmpty()) {
                    code = "Matière : "+s + "\n" + code;
                }

            }

        } catch (SQLException e) {
            System.out.println("Erreur : " + e.getMessage());
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return code;
    }

    public Connection ouvrirBD() throws SQLException, ClassNotFoundException {
        Connection conn = null;

        try {

            Class.forName(constante.driver);
            conn = DriverManager.getConnection(new constante().chaine_connexion, new constante().log_bd, new constante().pass_bd);

        } catch (SQLException e) {

            throw new SQLException("Erreur\nDetails " + e.getMessage());

        } catch (ClassNotFoundException e) {
            throw new ClassNotFoundException("Erreur\nDetails " + e.getMessage());
        }

        return conn;

    }

    public String getHeureActuelle(Date date) {
        String format = "dd/MM/yy H:mm:ss";
        if (date == null) {
            return "";
        }
        java.text.SimpleDateFormat formater = new java.text.SimpleDateFormat(format);

        return "" + formater.format(date);

    }
}
