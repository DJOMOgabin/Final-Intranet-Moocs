use intranet_mooc;

ALTER TABLE examen ADD CONSTRAINT cas1 foreign key (idcours) REFERENCES cours(idcours) ON DELETE CASCADE;

ALTER TABLE forum ADD CONSTRAINT cas2 foreign key (idcours) REFERENCES cours(idcours) ON DELETE CASCADE;

ALTER TABLE devoir ADD CONSTRAINT cas3 foreign key (idcours) REFERENCES cours(idcours) ON DELETE CASCADE;

ALTER TABLE devoir ADD CONSTRAINT cas4 foreign key (idetudiant) REFERENCES etudiant(idetudiant) ON DELETE CASCADE;

ALTER TABLE prof_cours ADD CONSTRAINT cas5 foreign key (idpro) REFERENCES enseignant(idenseignant) ON DELETE CASCADE;

ALTER TABLE prof_cours ADD CONSTRAINT cas6 foreign key (id_cours) REFERENCES cours(idcours) ON DELETE CASCADE;

ALTER TABLE quiz_prof ADD CONSTRAINT cas7 foreign key (idprof) REFERENCES enseignant(idenseignant) ON DELETE CASCADE;

ALTER TABLE quiz_prof ADD CONSTRAINT cas8 foreign key (idquiz) REFERENCES quiz(idquiz) ON DELETE CASCADE;

/*ALTER TABLE quiz ADD CONSTRAINT cas9 foreign key (idcours) REFERENCES cours(idcours) ON DELETE CASCADE;

ALTER TABLE session ADD CONSTRAINT cas10 foreign key (idEtudiant) REFERENCES etudiant(idetudiant) ON DELETE CASCADE;*/

ALTER TABLE video ADD CONSTRAINT cas11 foreign key (id_cours) REFERENCES cours(idcours) ON DELETE CASCADE;

ALTER TABLE corresp_divers_etudiant ADD CONSTRAINT cas12 foreign key (idetudiant) REFERENCES etudiant(idetudiant) ON DELETE CASCADE;

ALTER TABLE corresp_divers_etudiant ADD CONSTRAINT cas13 foreign key (iddivers) REFERENCES divers(iddivers) ON DELETE CASCADE;

ALTER TABLE cours ADD bloquer numeric(2) default 1;
