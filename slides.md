---
theme: seriph
background: https://source.unsplash.com/collection/94734566/1920x1080
class: text-center
highlighter: shikiji
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

<!-- <div class="pt-12">
  <span @click="$slidev.nav.next" class="px-2 py-1 rounded cursor-pointer" hover="bg-white bg-opacity-10">
    Weiter <carbon:arrow-right class="inline"/>
  </span>
</div> -->

<div class="abs-br m-6 flex gap-2">
  <button @click="$slidev.nav.openInEditor()" title="Open in Editor" class="text-xl slidev-icon-btn opacity-50 !border-none !hover:text-white">
    <carbon:edit />
  </button>

  <!--
  ADD LINK TO REPO IN GITHUB LATER
  -->
  <a href="https://github.com/slidevjs/slidev" target="_blank" alt="GitHub" title="Open in GitHub"
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
<br> <br>

- 🎯 **Ziele**
  - Laufendes DB-Cluster
  - Verfügbarkeit der Daten nach einem Ausfall
<br>

- 🪳 **CockroachDB** 
      - verteilte SQL-Datenbank, die auf Skalierbarkeit und Zuverlässigkeit ausgelegt ist

- ⚙️ **Aufbau** 
<br>
<br>

<img src="/pictures/cockroach_db.jpg"
     alt="cockroach DB icon"
     style="float: left; margin-right: 10px;" />
-----
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
image: https://source.unsplash.com/collection/94734566/1920x1080
---
<!--
TODO: ADD CUSTOM IMAGES

Cluster left side
-->
# Aufbau des Clusters
<img src="/pictures/multi-region_cockroachdb.png"
     alt="cockroach DB icon"
     style="float: left; margin-right: 10px;" />
<br>
*Initialisieren der Knoten*

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
image: https://source.unsplash.com/collection/94734566/1920x1080
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

*Ports:*
- Web Interface: [8080](http://localhost:8080)
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
preload: false
---

# Diagrams

You can create diagrams / graphs from textual descriptions, directly in your Markdown.

<div class="grid grid-cols-4 gap-5 pt-4 -mb-6">

```mermaid {scale: 0.5, alt: 'A simple sequence diagram'}
sequenceDiagram
    Alice->John: Hello John, how are you?
    Note over Alice,John: A typical interaction
```

```mermaid {theme: 'neutral', scale: 0.8}
graph TD
B[Text] --> C{Decision}
C -->|One| D[Result 1]
C -->|Two| E[Result 2]
```

```mermaid
mindmap
  root((mindmap))
    Origins
      Long history
      ::icon(fa fa-book)
      Popularisation
        British popular psychology author Tony Buzan
    Research
      On effectivness<br/>and features
      On Automatic creation
        Uses
            Creative techniques
            Strategic planning
            Argument mapping
    Tools
      Pen and paper
      Mermaid
```

```plantuml {scale: 0.7}
@startuml

package "Some Group" {
  HTTP - [First Component]
  [Another Component]
}

node "Other Groups" {
  FTP - [Second Component]
  [First Component] --> FTP
}

cloud {
  [Example 1]
}

database "MySql" {
  folder "This is my folder" {
    [Folder 3]
  }
  frame "Foo" {
    [Frame 4]
  }
}

[Another Component] --> [Example 1]
[Example 1] --> [Folder 3]
[Folder 3] --> [Frame 4]

@enduml
```

</div>

[Learn More](https://sli.dev/guide/syntax.html#diagrams)

---
src: ./pages/multiple-entries.md
hide: false
---

---
layout: center
class: text-center
---

# Learn More

[Documentations](https://sli.dev) · [GitHub](https://github.com/slidevjs/slidev)
