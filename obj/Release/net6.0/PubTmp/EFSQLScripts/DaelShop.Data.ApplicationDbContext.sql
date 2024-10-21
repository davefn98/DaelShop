IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241008194556_InitialCreate')
BEGIN
    CREATE TABLE [Categorias] (
        [CategoriaId] int NOT NULL IDENTITY,
        [Nombre] nvarchar(100) NOT NULL,
        [Descripcion] nvarchar(1000) NOT NULL,
        CONSTRAINT [PK_Categorias] PRIMARY KEY ([CategoriaId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241008194556_InitialCreate')
BEGIN
    CREATE TABLE [Roles] (
        [RolId] int NOT NULL IDENTITY,
        [Nombre] nvarchar(50) NOT NULL,
        CONSTRAINT [PK_Roles] PRIMARY KEY ([RolId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241008194556_InitialCreate')
BEGIN
    CREATE TABLE [Productos] (
        [ProductoId] int NOT NULL IDENTITY,
        [Codigo] nvarchar(50) NOT NULL,
        [Nombre] nvarchar(255) NOT NULL,
        [Modelo] nvarchar(255) NOT NULL,
        [Descripcion] nvarchar(1000) NOT NULL,
        [Precio] decimal(18,2) NOT NULL,
        [Imagen] nvarchar(255) NOT NULL,
        [CategoriaId] int NOT NULL,
        [Stock] int NOT NULL,
        [Marca] nvarchar(100) NOT NULL,
        [Activo] bit NOT NULL,
        CONSTRAINT [PK_Productos] PRIMARY KEY ([ProductoId]),
        CONSTRAINT [FK_Productos_Categorias_CategoriaId] FOREIGN KEY ([CategoriaId]) REFERENCES [Categorias] ([CategoriaId]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241008194556_InitialCreate')
BEGIN
    CREATE TABLE [Usuarios] (
        [UsuarioId] int NOT NULL IDENTITY,
        [Nombre] nvarchar(50) NOT NULL,
        [Telefono] nvarchar(50) NOT NULL,
        [NombreUsuario] nvarchar(50) NOT NULL,
        [Contrasenia] nvarchar(255) NOT NULL,
        [Correo] nvarchar(255) NOT NULL,
        [Direccion] nvarchar(100) NOT NULL,
        [Ciudad] nvarchar(20) NOT NULL,
        [Estado] nvarchar(20) NOT NULL,
        [CodigoPostal] nvarchar(10) NOT NULL,
        [RolId] int NOT NULL,
        CONSTRAINT [PK_Usuarios] PRIMARY KEY ([UsuarioId]),
        CONSTRAINT [FK_Usuarios_Roles_RolId] FOREIGN KEY ([RolId]) REFERENCES [Roles] ([RolId]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241008194556_InitialCreate')
BEGIN
    CREATE TABLE [Direcciones] (
        [DireccionId] int NOT NULL IDENTITY,
        [Address] nvarchar(50) NOT NULL,
        [Ciudad] nvarchar(20) NOT NULL,
        [Estado] nvarchar(20) NOT NULL,
        [CodigoPostal] nvarchar(10) NOT NULL,
        [UsuarioId] int NOT NULL,
        CONSTRAINT [PK_Direcciones] PRIMARY KEY ([DireccionId]),
        CONSTRAINT [FK_Direcciones_Usuarios_UsuarioId] FOREIGN KEY ([UsuarioId]) REFERENCES [Usuarios] ([UsuarioId]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241008194556_InitialCreate')
BEGIN
    CREATE TABLE [Pedidos] (
        [PedidoId] int NOT NULL IDENTITY,
        [UsuarioId] int NOT NULL,
        [Fecha] datetime2 NOT NULL,
        [Estado] nvarchar(max) NOT NULL,
        [DireccionIdSeleccionado] int NOT NULL,
        [Total] decimal(18,2) NOT NULL,
        CONSTRAINT [PK_Pedidos] PRIMARY KEY ([PedidoId]),
        CONSTRAINT [FK_Pedidos_Usuarios_UsuarioId] FOREIGN KEY ([UsuarioId]) REFERENCES [Usuarios] ([UsuarioId]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241008194556_InitialCreate')
BEGIN
    CREATE TABLE [DetallePedidos] (
        [DetallePedidoId] int NOT NULL IDENTITY,
        [PedidoId] int NOT NULL,
        [ProductoId] int NOT NULL,
        [Cantidad] int NOT NULL,
        [Precio] decimal(18,2) NOT NULL,
        CONSTRAINT [PK_DetallePedidos] PRIMARY KEY ([DetallePedidoId]),
        CONSTRAINT [FK_DetallePedidos_Pedidos_PedidoId] FOREIGN KEY ([PedidoId]) REFERENCES [Pedidos] ([PedidoId]) ON DELETE CASCADE,
        CONSTRAINT [FK_DetallePedidos_Productos_ProductoId] FOREIGN KEY ([ProductoId]) REFERENCES [Productos] ([ProductoId]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241008194556_InitialCreate')
BEGIN
    CREATE INDEX [IX_DetallePedidos_PedidoId] ON [DetallePedidos] ([PedidoId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241008194556_InitialCreate')
BEGIN
    CREATE INDEX [IX_DetallePedidos_ProductoId] ON [DetallePedidos] ([ProductoId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241008194556_InitialCreate')
BEGIN
    CREATE INDEX [IX_Direcciones_UsuarioId] ON [Direcciones] ([UsuarioId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241008194556_InitialCreate')
BEGIN
    CREATE INDEX [IX_Pedidos_UsuarioId] ON [Pedidos] ([UsuarioId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241008194556_InitialCreate')
BEGIN
    CREATE INDEX [IX_Productos_CategoriaId] ON [Productos] ([CategoriaId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241008194556_InitialCreate')
BEGIN
    CREATE INDEX [IX_Usuarios_RolId] ON [Usuarios] ([RolId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241008194556_InitialCreate')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20241008194556_InitialCreate', N'7.0.10');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241012061333_CreateTable')
BEGIN
    ALTER TABLE [DetallePedidos] DROP CONSTRAINT [FK_DetallePedidos_Pedidos_PedidoId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241012061333_CreateTable')
BEGIN
    ALTER TABLE [DetallePedidos] DROP CONSTRAINT [FK_DetallePedidos_Productos_ProductoId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241012061333_CreateTable')
BEGIN
    ALTER TABLE [Pedidos] DROP CONSTRAINT [FK_Pedidos_Usuarios_UsuarioId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241012061333_CreateTable')
BEGIN
    EXEC sp_rename N'[Pedidos].[DireccionIdSeleccionado]', N'DireccionIdSeleccionada', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241012061333_CreateTable')
BEGIN
    CREATE TABLE [Banners] (
        [BannerId] int NOT NULL IDENTITY,
        [ImageUrl] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Banners] PRIMARY KEY ([BannerId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241012061333_CreateTable')
BEGIN
    ALTER TABLE [DetallePedidos] ADD CONSTRAINT [FK_DetallePedidos_Pedidos_PedidoId] FOREIGN KEY ([PedidoId]) REFERENCES [Pedidos] ([PedidoId]) ON DELETE NO ACTION;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241012061333_CreateTable')
BEGIN
    ALTER TABLE [DetallePedidos] ADD CONSTRAINT [FK_DetallePedidos_Productos_ProductoId] FOREIGN KEY ([ProductoId]) REFERENCES [Productos] ([ProductoId]) ON DELETE NO ACTION;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241012061333_CreateTable')
BEGIN
    ALTER TABLE [Pedidos] ADD CONSTRAINT [FK_Pedidos_Usuarios_UsuarioId] FOREIGN KEY ([UsuarioId]) REFERENCES [Usuarios] ([UsuarioId]) ON DELETE NO ACTION;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20241012061333_CreateTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20241012061333_CreateTable', N'7.0.10');
END;
GO

COMMIT;
GO

