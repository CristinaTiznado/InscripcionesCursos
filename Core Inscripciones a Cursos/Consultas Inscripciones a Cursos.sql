USE inscripcionescursos;

-- Insertar al menos 5 estudiantes
INSERT INTO estudiantes (nombre_estudiante, edad) VALUES
('Ana', 21),
('Carlos', 24),
('Maria', 22),
('Juan', 19),
('Luis', 25);

-- Insertar al menos 4 cursos
INSERT INTO cursos (nombre_curso, duracion) VALUES
('Desarrollo Web', '60 horas'),
('Bases de Datos SQL', '40 horas'),
('Introducción a Python', '50 horas'),
('Diseño UX/UI', '30 horas');

-- Asociar a 4 estudiantes a al menos 2 cursos cada uno
-- Ana en Dev Web y SQL
-- Carlos en SQL y Python
-- Maria en Dev Web y UX/UI
-- Juan en Python y UX/UI
INSERT INTO inscripciones (id_estudiante, id_curso) VALUES
(1, 1), (1, 2), 
(2, 2), (2, 3), 
(3, 1), (3, 4), 
(4, 3), (4, 4); 

-- Proyecta a todos los estudiantes y sus respectivos cursos
SELECT e.nombre_estudiante, c.nombre_curso
FROM estudiantes e
INNER JOIN inscripciones i ON e.id_estudiante = i.id_estudiante
INNER JOIN cursos c ON i.id_curso = c.id_curso;

-- Proyecta todos los estudiantes que están inscritos en un curso específico, 
-- utilizando el nombre del curso como criterio de búsqueda.
SELECT e.nombre_estudiante, c.nombre_curso 
FROM estudiantes e
INNER JOIN inscripciones i ON e.id_estudiante = i.id_estudiante
INNER JOIN cursos c ON i.id_curso = c.id_curso
WHERE c.nombre_curso = 'Bases de Datos SQL';

-- Proyecta todos los cursos en los que está inscrito un estudiante específico, 
-- utilizando su nombre como criterio de búsqueda.
SELECT c.nombre_curso, e.nombre_estudiante
FROM cursos c
INNER JOIN inscripciones i ON c.id_curso = i.id_curso
INNER JOIN estudiantes e ON i.id_estudiante = e.id_estudiante
WHERE e.nombre_estudiante = 'Ana';

-- Cuenta el número de estudiantes inscritos en cada curso y 
-- muestra el nombre del curso junto con el número de estudiantes inscritos.
SELECT c.nombre_curso, COUNT(i.id_estudiante) AS total_estudiantes
FROM cursos c
LEFT JOIN inscripciones i ON c.id_curso = i.id_curso
GROUP BY c.id_curso, c.nombre_curso;

-- Encuentra los estudiantes que no están inscritos en ningún curso.
SELECT e.nombre_estudiante, e.edad
FROM estudiantes e
LEFT JOIN inscripciones i ON e.id_estudiante = i.id_estudiante
WHERE i.id_estudiante IS NULL;