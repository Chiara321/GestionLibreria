﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GestionLibreria.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class LibreriaEntities : DbContext
    {
        public LibreriaEntities()
            : base("name=LibreriaEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Clientes> Clientes { get; set; }
        public virtual DbSet<DetalleVentas> DetalleVentas { get; set; }
        public virtual DbSet<Libros> Libros { get; set; }
        public virtual DbSet<Ventas> Ventas { get; set; }
    }
}
