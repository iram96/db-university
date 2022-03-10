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



-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT * FROM `degrees` JOIN `students` ON `degrees`.`id` = `students`.`degree_id` WHERE `degrees`.`id` = 53;
-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT * FROM `departments` JOIN `degrees` ON `departments`.`id` = `degrees`.`department_id` WHERE `departments`.`id` = 7;
-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT * FROM `courses` JOIN `course_teacher` ON `courses`.`id` = `course_teacher`.`course_id` JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id` WHERE `course_teacher`.`teacher_id` = 44;
-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT * FROM `departments` JOIN `degrees` ON `departments`.`id` = `degrees`.`department_id` JOIN `students` ON `degrees`.`id` = `students`.`degree_id` ORDER BY `students`.`surname` ,`students`.`name` ASC;
-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `teachers`.`name`, `teachers`.`surname`, `courses`.`name`, `degrees`.`name` FROM `degrees` JOIN `courses` ON `degrees`.`id` = `courses`.`degree_id` JOIN `course_teacher` ON `courses`.`degree_id` = `course_teacher`.`course_id` JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id`;
-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica
SELECT `teachers`.`name`, `teachers`.`surname`, `departments`.`name` FROM `departments` JOIN `degrees` ON `departments`.`id` = `degrees`.`department_id` JOIN `courses` ON `degrees`.`department_id` = `courses`.`degree_id` JOIN `course_teacher` ON `courses`.`degree_id` = `course_teacher`.`course_id` JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id` WHERE `departments`.`id` = 5;
