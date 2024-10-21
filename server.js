const Hapi = require('@hapi/hapi');
const MySQL = require('mysql');

const server = Hapi.server({
  port: 9000,
  host: 'localhost',
});

const connection = MySQL.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'hr'
});

connection.connect()

server.route({
  method: 'POST',
  path: '/add',
  handler: function (request, reply) {
    const {nama, tgl_lahir, gaji} = request.payload;

    connection.query('INSERT INTO karyawan(nama, tgl_lahir, gaji) VALUES ("'+ nama +'", "'+ tgl_lahir +'", '+ gaji +')', function (error, results, fields) {
      if (error) throw error;
      console.log(results);
    });

    const response = reply.response({
      status: 'success',
      message: 'Sukses',
    });
    response.code(200);
    return response;
  },
});

server.route({
  method: 'PUT',
  path: '/update/{id}',
  handler: function (request, reply) {
    const {id} = request.params;
    const {nama, tgl_lahir, gaji} = request.payload;

    connection.query('UPDATE karyawan SET nama = "'+ nama +'", tgl_lahir = "'+ tgl_lahir +'", gaji = '+ gaji +' WHERE id = '+ id +';', function (error, results, fields) {
      if (error) throw error;
      console.log(results);
    });

    const response = reply.response({
      status: 'success',
      message: 'Sukses',
    });
    response.code(200);
    return response;
  },
});

server.route({
  method: 'DELETE',
  path: '/delete/{id}',
  handler: function (request, reply) {
    const {id} = request.params;

    connection.query('DELETE FROM karyawan WHERE id = '+ id +';', function (error, results, fields) {
      if (error) throw error;
      console.log(results);
    });

    const response = reply.response({
      status: 'success',
      message: 'Sukses',
    });
    response.code(200);
    return response;
  },
});

server.start();
console.log(`Server berjalan pada ${server.info.uri}`);