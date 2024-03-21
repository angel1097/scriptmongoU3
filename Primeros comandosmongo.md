### Ver bases de datos o colecciones
show dbs

### Usar una colección o base de datos
use bds

### Crear colección
db.createCollection()

### Usar la base de datos "db1"
use db1

### Mostrar colecciones
show collections

### Insertar un documento en la colección "empleado"
db.empleado.insertOne({ nombre: 'Angel', edad: 54 })

### Encontrar todos los documentos en la colección "empleado"
db.empleado.find()

### Insertar varios documentos en la colección "empleado"
db.empleado.insertMany([
    { nombre: 'Hermeregildo', edad: 67 },
    { nombre: 'soy la vaca lola', edad: 14, sexo: 'Mujer' },
    { nombre: 'Romulo', edad: 40, nacionalidad: 'Nigeriano' },
    { nombre: 'Cristian Andres', localidad: 'SanMiguel', nacionalidad: 'Aleman', edad: 'esta morro' }
])

### Operador \$or para encontrar libros con precio > 25 o cantidad < 15
db.libros.find({ \$or: [{ precio: { \$gt: 25 } }, { cantidad: { \$lt: 15 } }] })


### Encontrar libros con editorial "Planeta" o precio menor a 30
db.libros.find({ \$or: [{ editorial: 'Planeta' }, { precio: { \$lt: 30 } }] })


### Encontrar libros escritos por "Borges" o con cantidad disponible >= 20
db.libros.find({ \$or: [{ autor: 'Borges' }, { cantidad: { \$gte: 20 } }] })


### Encontrar libros con editorial "Biblio" y precio <= 30
db.libros.find({ \$and: [{ editorial: 'Biblio' }, { precio: { \$lte: 30 } }] })

### Encontrar libros escritos por "Jose Hernandez" y cantidad disponible > 10
db.libros.find({ \$and: [{ autor: 'Jose Hernandez' }, { cantidad: { \$gt: 10 } }] })


### Seleccionar libros de la editorial "Biblio" con precio > 40 o de la editorial "Planeta" con precio > 30
db.libros.find({ \$or: [{ \$and: [{ editorial: 'Biblio' }, { precio: { \$gt: 40 } }]}, { \$and: [{ precio: { \$gt: 30 } }, { editorial: 'Planeta' }]}] })


### Mostrar solo la columna "titulo"
db.libros.find({}, { titulo: 1 })

### Mostrar todas las columnas excepto "_id"
db.libros.find({}, { _id: 0, titulo: 1 })

### Encontrar libros sin título
db.libros.find({ titulo: { \$exists: false } })

### Encontrar libros con título
db.libros.find({ titulo: { \$exists: true } })

### Encontrar libros con precio > 10 y autor existente
db.libros.find({ \$and: [{ precio: { \$gt: 10 } }, { autor: { \$exists: true } }] })


### Encontrar libros con tipo de dato string en el título
db.libros.find({ titulo: { \$type: 'string' } })

### Actualizar precio a 150 para libros con precio > 9
db.libros.updateMany({ precio: { \$gt: 9 } }, { \$set: { precio: 150 } })

### Incrementar precio en 5 para todos los libros
db.libros.updateMany({}, { \$inc: { precio: 5 } })

### Incrementar precio en 5 para el libro con _id 10
db.libros.updateMany({ _id: 10 }, { \$inc: { precio: 5 } })

### Multiplicar por dos el precio para libros con cantidad > 20
db.libros.updateMany({ cantidad: { \$gt: 20 } }, { \$mul: { precio: 2 } })


### Reemplazar un documento
db.libros.replaceOne({ "_id": 10 }, { "titulo": "Las pateaventuras de ezequiel y matteo" })

### Eliminar un documento
db.libros.deleteOne({ "_id": 10 })

### Buscar libros con la letra 't' en el título
db.libros.find({ titulo: /t/ })

### Buscar libros cuyos títulos terminan en 'tos'
db.libros.find({ titulo: /tos$/ })

### Buscar libros cuyos títulos comienzan con 'M'
db.libros.find({ titulo: /^M/ })

### Buscar libros que contengan la palabra "para"
db.libros.find({ titulo: { \$regex: 'para' } })

### Buscar libros que contengan la palabra "mongo" (case-insensitive)
db.libros.find({ titulo: { \$regex: /MONGO/, \$options: 'i' } })

### Ordenar libros de manera ascendente por título
db.libros.find({}, { titulo: 1, precio: 1, _id: 0 }).sort({ titulo: 1 })

### Ordenar libros de manera descendente por título
db.libros.find({}, { titulo: 1, precio: 1, _id: 0 }).sort({ titulo: -1 })

### Eliminar la colección "ejemplo"
db.ejemplo.drop()

### Eliminar la base de datos actual
db.dropDatabase()