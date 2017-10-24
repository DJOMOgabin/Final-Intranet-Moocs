package Modele;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DevoirBean {

    public static List<Devoir> getDevoirBD(String idProf) {
        List<Devoir> ls = new ArrayList<Devoir>();
        try {
            Statement stat = Examen.getConn().createStatement();
            Devoir d;
            ResultSet rs = stat.executeQuery("select titrecours,"
            		+ "count(devoir.idcours) nombre, sum(devoir.note)/count(devoir.idcours) note "
            		+ "from devoir,cours,prof_cours where devoir.idcours=cours.idcours and idpro = '"+idProf+"' "
            		+ "and id_cours=cours.idcours and devoir.enseignant='true' group by devoir.idcours;");
            
            while (rs.next()) {
                d = new Devoir();
                d.setNomCours(rs.getString("titrecours"));
                d.setNombreDevoir(rs.getString("nombre"));
                d.setNoteMoyenne(String.format("%.2f",Float.parseFloat(rs.getString("note"))));
                ls.add(d);
            }

            rs.close();
            stat.close();

        } catch (SQLException e) {
            System.out.println("Erreur : " + e.getMessage());
        } 
        return ls;
    }

    public Integer getnombreParticipant(Integer idDevoir) {
        if (idDevoir == null) {
            return 0;
        }
        int nombre = 0;
        try {
            Statement stat = Examen.getConn().createStatement();

            ResultSet rs = stat.executeQuery("select count(id_etudiant) as nombre from devoir_etudiant where id_devoir=" + idDevoir);

            while (rs.next()) {
                nombre = rs.getInt("nombre");
                break;

            }

            rs.close();
            stat.close();

        } catch (SQLException e) {
            System.out.println("Erreur : " + e.getMessage());
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
        if (idDevoir == null || min == null || max == null) {
            return 0;
        }
        int nombre = 0;
        try {
            Statement stat = Examen.getConn().createStatement();

            ResultSet rs = stat.executeQuery("select count(id_etudiant) as nombre from devoir_etudiant where id_devoir=" + idDevoir + " and note>=" + min + " and note<" + max);

            while (rs.next()) {
                nombre = rs.getInt("nombre");
                break;

            }

            rs.close();
            stat.close();

        } catch (SQLException e) {
            System.out.println("Erreur : " + e.getMessage());
        }
        return nombre;
    }

    public String getHistogramme(String idDevoir) {
        String code = "[[\"id\",\"note\"]";
        if (idDevoir == null || idDevoir.isEmpty()) {
            return code + "]";
        }
        try {
            Statement stat = Examen.getConn().createStatement();

            ResultSet rs = stat.executeQuery("select id_etudiant  ,note  from devoir_etudiant where id_devoir=" + idDevoir);

            while (rs.next()) {
                code = code + "[\"" + rs.getString("id_etudiant") + "\"," + rs.getDouble("note") + "]";

            }
            code = code + "]";
            rs.close();
            stat.close();
        } catch (SQLException e) {
            System.out.println("Erreur : " + e.getMessage());
        }
        return code;
    }

    public String getTitreCercle(String idDevoir) {
        String code = "";
        if (idDevoir == null || idDevoir.isEmpty()) {
            return code;
        }
        try {
            Statement stat = Examen.getConn().createStatement();

            ResultSet rs = stat.executeQuery("select id_cours  ,date_echeance, type_devoir  from devoir where id_devoir=" + idDevoir);
            Integer idc = null;
            while (rs.next()) {
                code = code + "Intitulé :" + rs.getString("type_devoir") + "\nDate : " + getHeureActuelle(rs.getDate("date_echeance")) + "";
                idc = rs.getInt("id_cours");
            }

            rs.close();
            stat.close();
            if (idc != null) {
                Cours c = new Cours();
                String s = c.getTitreCoursID(idc) + "";
                if (s != null && !s.isEmpty()) {
                    code = "Matière : "+s + "\n" + code;
                }

            }

        } catch (SQLException e) {
            System.out.println("Erreur : " + e.getMessage());
        }
        return code;
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
