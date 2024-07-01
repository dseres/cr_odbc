# cr-odbc

This is a test program written in Crystal language demonstrating how to connect to an Oracle database using the odbc driver. 


## Installation

The project contains a devcontainer. 
To build the dev container you need to add an odbc.ini and a TNSNAMES.ORA file and download latest [Oracle Instant client](https://www.oracle.com/database/technologies/instant-client/linux-x86-64-downloads.html) into the `.devonctainer/oracle_instantclient` directory. 

An example of odbc.ini:
```text
[DSN1]
Driver = Oracle 23 ODBC driver
DSN = DSN1
ServerName = DSN1
```
An example of TNSNAMES.ORA:
```text
dsn1 = (DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=127.0.0.1)(PORT=1521))(CONNECT_DATA=(SID=dsn1)))

```

After that you can easily build the container in VS Code. You can build and run the image manually too:
```bash
cd .devcontainer
docker build --tag cr-odbc:latest .
cd ..
docker run --rm --name cr-odbc -ti -v ./:/workspace cr-odbc:latest fish
```

You can build the project in the container with:
```
shards build
```

## Usage

```
shards run cr-odbc -- -d DSN1 -u USER -p PASSWD
```

## Development

## Contributing

1. Fork it (<https://github.com/your-github-user/cr-odbc/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Dávid Seres](https://github.com/dseres) - creator and maintainer
