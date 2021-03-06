﻿using NLog;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TrolleyTracker.Models;
using TrolleyTracker.ViewModels;

namespace TrolleyTracker.Controllers
{
    public class TrolleysController : Controller
    {

        private static Logger logger = LogManager.GetCurrentClassLogger();

        // GET: Trolleys
        public ActionResult Index()
        {
            using (var db = new TrolleyTrackerContext())
            {
                var trolleys = from t in db.Trolleys
                               orderby t.Number, t.TrolleyName
                               select t;
                return View(trolleys.ToList());
            }
        }


        // GET: Trolleys/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            using (var db = new TrolleyTrackerContext())
            {
                Trolley trolley = db.Trolleys.Find(id);
                if (trolley == null)
                {
                    return HttpNotFound();
                }
                return View(trolley);
            }
        }

        // GET: Trolleys/Create
        [CustomAuthorize(Roles = "RouteManagers")]
        public ActionResult Create()
        {
            var t = new Trolley();
            t.IconColorRGB = "#008000";  // Must have starting value for Farbtastic
            return View(t);
        }

        // POST: Trolleys/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [CustomAuthorize(Roles = "RouteManagers")]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TrolleyName,Number,IconColorRGB,CurrentLat,CurrentLon,SyncromaticsNumber")] Trolley trolley)
        {
            if (ModelState.IsValid)
            {
                using (var db = new TrolleyTrackerContext())
                {
                    db.Trolleys.Add(trolley);
                    db.SaveChanges();
                }
                logger.Info($"Created trolley # {trolley.Number} '{trolley.TrolleyName}'");

                TrolleyCache.UpdateTrolley(trolley);
                return RedirectToAction("Index");
            }

            return View(trolley);
        }

        // GET: Trolleys/Edit/5
        [CustomAuthorize(Roles = "RouteManagers")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            using (var db = new TrolleyTrackerContext())
            {
                Trolley trolley = db.Trolleys.Find(id);
                if (trolley == null)
                {
                    return HttpNotFound();
                }
                TrolleyCache.UpdateTrolley(trolley);
                return View(trolley);
            }
        }


        // POST: Trolleys/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [CustomAuthorize(Roles = "RouteManagers")]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,TrolleyName,Number,IconColorRGB,CurrentLat,CurrentLon,SyncromaticsNumber")] Trolley trolley)
        {
            if (ModelState.IsValid)
            {
                using (var db = new TrolleyTrackerContext())
                {
                    db.Entry(trolley).State = EntityState.Modified;
                    db.SaveChanges();
                }
                logger.Info($"Updated trolley # {trolley.Number} '{trolley.TrolleyName}'");

                return RedirectToAction("Index");
            }
            return View(trolley);
        }

        // GET: Trolleys/Delete/5
        [CustomAuthorize(Roles = "RouteManagers")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            using (var db = new TrolleyTrackerContext())
            {
                Trolley trolley = db.Trolleys.Find(id);
                if (trolley == null)
                {
                    return HttpNotFound();
                }
                return View(trolley);
            }
        }

        // POST: Trolleys/Delete/5
        [HttpPost, ActionName("Delete")]
        [CustomAuthorize(Roles = "RouteManagers")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            using (var db = new TrolleyTrackerContext())
            {
                Trolley trolley = db.Trolleys.Find(id);

                logger.Info($"Deleted trolley # {trolley.Number} '{trolley.TrolleyName}'");


                db.Trolleys.Remove(trolley);
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            //if (disposing)
            //{
            //    db.Dispose();
            //}
            base.Dispose(disposing);
        }
    }
}
