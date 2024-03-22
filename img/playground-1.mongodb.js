// MongoDB Playground
// Use Ctrl+Space inside a snippet or a string literal to trigger completions.

// The current database to use.
use('db1');

// Create a new document in the collection.
db.getCollection('libros').insertOne({

});

/**
 * _id: The id of the group.
 * fieldN: The first field name.
 */
{
    _id: "$editorial",
    "Numero Documentos": {
      $count: {},
    },
  }
/**
 * Provide any number of field/order pairs.
 */
{
    "Numero Documentos":1
    
  }

  [
    {
      $group:
        /**
         * _id: The id of the group.
         * fieldN: The first field name.
         */
        {
          _id: "$editorial",
          "Numero Documentos": {
            $count: {},
          },
        },
    },
    {
      $group:
        /**
         * _id: The id of the group.
         * fieldN: The first field name.
         */
        {
          _id: "$editorial",
          "Numero Documentos": {
            $count: {},
          },
          Media: {
            $avg: "precio",
          },
        },
    },
  ]

  
  
  
  [
    {
      $group:
        /**
         * _id: The id of the group.
         * fieldN: The first field name.
         */
        {
          _id: "$editorial",
          "Numero Documentos": {
            $count: {},
          },
          Media: {
            $avg: "$precio",
          },
          "Precio Maximo": {
            $max: "$precio",
          },
        },
    },
  ]


  [
    {
      $group:
        /**
         * _id: The id of the group.
         * fieldN: The first field name.
         */
        {
          _id: "$editorial",
          Numero: {
            $count: {},
          },
          Media: {
            $avg: "$precio",
          },
        },
    },
    {
      $set:
        /**
         * field: The field name
         * expression: The expression.
         */
        {
          "Media total": {
            $trunc: ["$Media", 2],
          },
        },
    },
  ]

  [
    {
      $group:
        /**
         * _id: The id of the group.
         * fieldN: The first field name.
         */
        {
          _id: "$editorial",
          Numero: {
            $count: {},
          },
          Media: {
            $avg: "$precio",
          },
        },
    },
    {
      $set:
        /**
         * field: The field name
         * expression: The expression.
         */
        {
          "Media total": {
            $trunc: ["$Media", 2],
          },
        },
    },
    {
      $out:
        /**
         * Provide the name of the output collection.
         */
        "Media_Editorial",
    },
  ]

  [
    {
      $group:
        /**
         * _id: The id of the group.
         * fieldN: The first field name.
         */
        {
          _id: "$editorial",
          Numero: {
            $count: {},
          },
          Media: {
            $avg: "$precio",
          },
        },
    },
    {
      $set:
        /**
         * field: The field name
         * expression: The expression.
         */
        {
          "Media total": {
            $trunc: ["$Media", 2],
          },
        },
    },
    {
      $unset:
        /**
         * Provide the name of the output collection.
         */
        "Media",
    },
  ]