DROP TABLE IF EXISTS registrations;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS formations;
DROP TABLE IF EXISTS teachers;

CREATE TABLE formations(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    code TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    level TEXT NOT NULL,
    description TEXT NOT NULL DEFAULT ''
);

CREATE TABLE students(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_number TEXT NOT NULL UNIQUE,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    birth_date TEXT NOT NULL
);

CREATE TABLE courses(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    code TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    semester INTEGER NOT NULL CHECK(semester BETWEEN 1 AND 10),
    formation_id INTEGER NOT NULL,
    FOREIGN KEY(formation_id) REFERENCES formations(id)
);

CREATE TABLE registrations(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER NOT NULL,
    formation_id INTEGER NOT NULL,
    academic_year TEXT NOT NULL,
    UNIQUE(student_id,academic_year),
    FOREIGN KEY(student_id) REFERENCES students(id),
    FOREIGN KEY(formation_id) REFERENCES formations(id)
);

CREATE TABLE teachers(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    teacher_number TEXT NOT NULL UNIQUE,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    department TEXT NOT NULL,
    hire_date TEXT NOT NULL
);

-- Insertion des Professeurs
INSERT INTO teachers (teacher_number, first_name, last_name, email, department, hire_date) 
VALUES ('T001', 'Hakim', 'Mabed', 'hakim.mabed@univ-fcomte.fr', 'Informatique', '2010-09-01');

INSERT INTO teachers (teacher_number, first_name, last_name, email, department, hire_date) 
VALUES ('T002', 'Jean-Michel', 'Prof', 'jm.prof@univ-fcomte.fr', 'Multimédia', '2015-09-01');

INSERT INTO teachers (teacher_number, first_name, last_name, email, department, hire_date) 
VALUES ('T003', 'Pierre', 'Pracht', 'pierre.pracht@univ-fcomte.fr', 'Développement', '2022-09-01');

-- Insertion des Formations
INSERT INTO formations (code, name, level, description) VALUES ('MMI', 'BUT Métiers du Multimédia et de l''Internet', 'Bac+3', 'Formation web, design et communication');
INSERT INTO formations (code, name, level, description) VALUES ('INFO', 'Licence Informatique', 'Bac+3', 'Développement et architecture logicielle');

-- Insertion des Étudiants 
INSERT INTO students (student_number, first_name, last_name, email, birth_date) VALUES ('S001', 'Enzo', 'Hillairet', 'enzo.hillairet@edu.univ-fcomte.fr', '2007-08-28');
INSERT INTO students (student_number, first_name, last_name, email, birth_date) VALUES ('S002', 'Thomas', 'Perruchot', 'thomas.perruchot@edu.univ-fcomte.fr', '200-11-20');

-- Insertion des Cours
INSERT INTO courses (code, name, semester, formation_id) VALUES ('DEV-WEB', 'Développement Web et Astro', 3, 1);
INSERT INTO courses (code, name, semester, formation_id) VALUES ('ARCH-WEB', 'Architecture Web', 3, 1);

-- Insertion des Inscriptions
INSERT INTO registrations (student_id, formation_id, academic_year) VALUES (1, 1, '2025-2026');
INSERT INTO registrations (student_id, formation_id, academic_year) VALUES (2, 1, '2025-2026');