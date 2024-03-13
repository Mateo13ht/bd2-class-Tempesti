CREATE TABLE TipoDocumento (
    IDTipoDocumento INT PRIMARY KEY,
    tipo VARCHAR(255),
    descripcion VARCHAR(255)
);

CREATE TABLE Tarjeta (
    numeroTarjeta INT PRIMARY KEY,
    CVV INT,
    nombreTitular VARCHAR(255),
    apellidoTitular VARCHAR(255),
    telefono VARCHAR(20),
    fechaExpiracion DATETIME
);

CREATE TABLE Pasajero (
    numeroDocumento INT PRIMARY KEY,
    IDTipoDocumento INT,
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    telefono INT,
    correoElectronico VARCHAR(255),
    FOREIGN KEY (IDTipoDocumento) REFERENCES TipoDocumento(IDTipoDocumento)
);

CREATE TABLE Ciudad (
    IDCiudad INT PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion VARCHAR(255)
);

CREATE TABLE Aeronave (
    numeroAeronave VARCHAR(255) PRIMARY KEY,
    modelo VARCHAR(255)
);

CREATE TABLE Puerta (
    IDPuerta INT PRIMARY KEY,
    ubicacion VARCHAR(255),
    descripcion VARCHAR(255)
);

CREATE TABLE ServicioComida (
    IDServicioComida INT PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion VARCHAR(255)
);

CREATE TABLE EstadoAsiento (
    IDEstadoAsiento INT PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion VARCHAR(255)
);

CREATE TABLE TipoAsiento (
    IDTipoAsiento INT PRIMARY KEY,
    descripcion VARCHAR(255),
    precio FLOAT
);

CREATE TABLE Asiento (
    IDAsiento INT PRIMARY KEY,
    ubicacion VARCHAR(255),
    IDEstadoAsiento INT,
    IDTipoAsiento INT,
    FOREIGN KEY (IDEstadoAsiento) REFERENCES EstadoAsiento(IDEstadoAsiento),
    FOREIGN KEY (IDTipoAsiento) REFERENCES TipoAsiento(IDTipoAsiento)
);

CREATE TABLE Vuelo (
    numeroVuelo VARCHAR(255) PRIMARY KEY,
    nombreCompania VARCHAR(255),
    ciudadSalida INT,
    ciudadLlegada INT,
    fechaHoraSalida DATETIME,
    fechaHoraLlegada DATETIME,
    numeroAeronave VARCHAR(255),
    distancia FLOAT,
    IDServicioComida INT,
    IDPuerta INT,
    FOREIGN KEY (ciudadSalida) REFERENCES Ciudad(IDCiudad),
    FOREIGN KEY (ciudadLlegada) REFERENCES Ciudad(IDCiudad),
    FOREIGN KEY (numeroAeronave) REFERENCES Aeronave(numeroAeronave),
    FOREIGN KEY (IDServicioComida) REFERENCES ServicioComida(IDServicioComida),
    FOREIGN KEY (IDPuerta) REFERENCES Puerta(IDPuerta)
);

CREATE TABLE Reserva (
    codigoReserva VARCHAR(255) PRIMARY KEY,
    numeroVuelo VARCHAR(255),
    IDPasajero INT,
    IDAsiento INT,
    fechaHoraReserva DATETIME,
    numeroTarjeta FLOAT,
    FOREIGN KEY (numeroVuelo) REFERENCES Vuelo(numeroVuelo),
    FOREIGN KEY (IDPasajero) REFERENCES Pasajero(numeroDocumento),
    FOREIGN KEY (IDAsiento) REFERENCES Asiento(IDAsiento)
);
