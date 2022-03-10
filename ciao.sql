-- 1. Selezionare tutti gli studenti nati nel 1990
SELECT * FROM `students` WHERE `date_of_birth` LIKE '1990-%'
-- 2. Selezionare tutti i corsi che valgono più di 10 crediti
SELECT * FROM `students` WHERE `cfu` >= 10
-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT * FROM `students` WHERE 2022 - YEAR(`date_of_birth`) >= 30
-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea 
SELECT * FROM `courses` WHERE `period` = 'I semestre' AND `year` = 1
-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020
SELECT * FROM `exams` WHERE HOUR(`hour`) > 14 AND `date` = '2020-06-20'
-- 6. Selezionare tutti i corsi di laurea magistrale
SELECT * FROM `degrees` WHERE `level` = 'magistrale' 
-- 7. Da quanti dipartimenti è composta l'università?
SELECT COUNT(*) FROM `departments`
-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono?
SELECT COUNT(*) FROM `teachers` WHERE `phone` IS NULL


-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*) FROM `students` GROUP BY YEAR(`enrolment_date`)
-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(*) FROM `teachers` GROUP BY `office_address` WHERE COUNT(*) > 1
-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT ROUND(AVG(`vote`)) FROM `exam_student` GROUP BY `exam_id`
-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(*), `department_id` FROM `degrees` GROUP BY `department_id`