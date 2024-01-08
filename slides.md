---
theme: mokkapps
background: https://source.unsplash.com/collection/94734566/1920x1080
class: text-center
lineNumbers: false
info: |
  ## Slidev slides
  Presentation slides for FeTS Mini Project
drawings:
  persist: false
transition: slide-left
title: DB Cluster
mdc: true
---

# Datenbank Cluster
## FeTS Team 2

<div class="abs-br m-6 flex gap-2">
  <button @click="$slidev.nav.openInEditor()" title="Open in Editor" class="text-xl slidev-icon-btn opacity-50 !border-none !hover:text-white">
    <carbon:edit />
  </button>

  <a href="https://github.com/moussaka-crypto/DB-Cluster/" target="_blank" alt="GitHub" title="Source on GitHub"
    class="text-xl slidev-icon-btn opacity-50 !border-none !hover:text-white">
    <carbon-logo-github />
  </a>
</div>

<!--
The last comment block of each slide will be treated as slide notes. It will be visible and editable in Presenter Mode along with the slide. [Read more in the docs](https://sli.dev/guide/syntax.html#notes)
-->

---
layout: intro
transition: fade-out
---

# Einführung

*Im Rahmen der Veranstaltung "Fehlertolerante Systeme" von Prof. Classen gibt es die Aufgabe ein laufendes Mini-Projekt zu entwickeln.*
<br>

<img src="/img/cockroach_db.jpg"
     alt="cockroach DB icon"
     style="width: 45%; float: right;" /> 
<br>

- 🎯 **Ziele**
  - Laufendes DB-Cluster
  - Verfügbarkeit der Daten nach einem Ausfall
<br>

- 🪳 **CockroachDB** 
      - verteilte SQL-Datenbank, die auf Skalierbarkeit und Zuverlässigkeit ausgelegt ist

- ⚙️ **Aufbau** 
<br>
<br>

<style>

h1 {
  background-color: #2B90B6;
  background-image: linear-gradient(45deg, #4EC5D4 10%, #146b8c 20%);
  background-size: 100%;
  -webkit-background-clip: text;
  -moz-background-clip: text;
  -webkit-text-fill-color: transparent;
  -moz-text-fill-color: transparent;
}
</style>

---
layout: image-right
image: ./img/multi-region_cockroachdb.png
---

# Aufbau des Clusters

*Initialisieren der Knoten*
<br> <br>

```bash {all|5,6|2-4|all} twoslash
cockroach start \ 
--insecure \ 
--advertise-addr= 10.0.2.15 \ 
--join= 10.0.2.15,10.0.2.14 \ 
--cache=.25 \
--max-sql-memory=.25 \ 
--background
```

<style>
.footnotes-sep {
  @apply mt-20 opacity-10;
}
.footnotes {
  @apply text-sm opacity-75;
}
.footnote-backref {
  display: none;
}
</style>

---
layout: image-left
image: ./img/multi-region_cockroachdb.png
---

# Aufbau des Clusters 2
*Initialisieren des Clusters*
<!--
TODO: ADD CUSTOM IMAGES

Cluster right side
-->
```bash
cockroach init \
--insecure \
--host=10.0.2.15

cockroach sql 
--insecure \ 
--host=10.0.2.15:26257 \ 
--user=cedric
```

<style>
.footnotes-sep {
  @apply mt-20 opacity-10;
}
.footnotes {
  @apply text-sm opacity-75;
}
.footnote-backref {
  display: none;
}
</style>
<br>

- Web Interface: **[8080](http://localhost:8080)**
- Nodes: **26257**

---
layout: default
image: https://source.unsplash.com/collection/94734566/1920x1080
---

# Aufbau des Clusters 3
*Datenbank mit Dummy-Einträgen erstellen*

```sql {all|4-12|13-20|all} twoslash
CREATE DATABASE dummy_db;
USE dummy_db;

CREATE TABLE dummy_table (
   id INT PRIMARY KEY,
   name VARCHAR(255),
   occupation VARCHAR(255),
   language VARCHAR(50),
   favorite_subject VARCHAR(100),
   semester INT
);

INSERT INTO dummy_table (id, name, occupation, language, favorite_subject, semester VALUES
   (1, 'John Doe', 'Software Engineer', 'English', 'Computer Science', 1),
   (2, 'Jane Smith', 'Data Analyst', 'Spanish', 'Statistics', 3),
   (3, 'Bob Johnson', 'Student', 'French', 'Mathematics', 2),
   (4, 'Cedric Lux', 'Student', 'German', 'Fehlertolerante Systeme', 5),
   (5, 'Hristomir Dimov', 'Student', 'German', 'Fehlertolerante Systeme', 5),
   (6, 'Nodirjon Tadjiev', 'Student', 'German', 'Fehlertolerante Systeme', 5)
```

---
layout: end
class: text-center
---

# LIVE DEMO

[Docs](https://www.cockroachlabs.com/docs/v23.1/deploy-cockroachdb-on-premises-insecure) · [GitHub](https://github.com/moussaka-crypto/DB-Cluster/)

<img src="/img/engineering-dependability-and-fault-tolerance.png"
     alt="cockroach DB icon"
     style="width:50%; margin-left: auto; margin-right: auto;" /> 
     