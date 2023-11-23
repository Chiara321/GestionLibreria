﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using GestionLibreria.Models;

namespace GestionLibreria.Controllers
{
    public class DetalleVentasController : Controller
    {
        private LibreriaEntities db = new LibreriaEntities();

        // GET: DetalleVentas
        public ActionResult Index()
        {
            var detalleVentas = db.DetalleVentas.Include(d => d.Libros).Include(d => d.Ventas);
            return View(detalleVentas.ToList());
        }

        // GET: DetalleVentas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DetalleVentas detalleVentas = db.DetalleVentas.Find(id);
            if (detalleVentas == null)
            {
                return HttpNotFound();
            }
            return View(detalleVentas);
        }

        // GET: DetalleVentas/Create
        public ActionResult Create()
        {
            ViewBag.LibroISBN = new SelectList(db.Libros, "ISBN", "Titulo");
            ViewBag.VentaID = new SelectList(db.Ventas, "VentaID", "VentaID");
            return View();
        }

        // POST: DetalleVentas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "DetalleVentaID,LibroISBN,VentaID,Cantidad,PrecioUnitario")] DetalleVentas detalleVentas)
        {
            if (ModelState.IsValid)
            {
                db.DetalleVentas.Add(detalleVentas);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.LibroISBN = new SelectList(db.Libros, "ISBN", "Titulo", detalleVentas.LibroISBN);
            ViewBag.VentaID = new SelectList(db.Ventas, "VentaID", "VentaID", detalleVentas.VentaID);
            return View(detalleVentas);
        }

        // GET: DetalleVentas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DetalleVentas detalleVentas = db.DetalleVentas.Find(id);
            if (detalleVentas == null)
            {
                return HttpNotFound();
            }
            ViewBag.LibroISBN = new SelectList(db.Libros, "ISBN", "Titulo", detalleVentas.LibroISBN);
            ViewBag.VentaID = new SelectList(db.Ventas, "VentaID", "VentaID", detalleVentas.VentaID);
            return View(detalleVentas);
        }

        // POST: DetalleVentas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "DetalleVentaID,LibroISBN,VentaID,Cantidad,PrecioUnitario")] DetalleVentas detalleVentas)
        {
            if (ModelState.IsValid)
            {
                db.Entry(detalleVentas).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.LibroISBN = new SelectList(db.Libros, "ISBN", "Titulo", detalleVentas.LibroISBN);
            ViewBag.VentaID = new SelectList(db.Ventas, "VentaID", "VentaID", detalleVentas.VentaID);
            return View(detalleVentas);
        }

        // GET: DetalleVentas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DetalleVentas detalleVentas = db.DetalleVentas.Find(id);
            if (detalleVentas == null)
            {
                return HttpNotFound();
            }
            return View(detalleVentas);
        }

        // POST: DetalleVentas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DetalleVentas detalleVentas = db.DetalleVentas.Find(id);
            db.DetalleVentas.Remove(detalleVentas);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
