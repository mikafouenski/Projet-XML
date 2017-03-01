# Projet XML

[Sujet](http://jean-luc.massat.perso.luminy.univ-amu.fr/ens/xml/devoir.html)

* ALLAM Thomas
* BERNARDINI Mickaël

## Contenu

* un fichier XML décrivant la structure du Master (unités, semestres, intervemants, parcours).
* une DTD pour ce fichier XML.
* un schéma pour ce fichier XML.
* plusieurs feuilles de style XSL, rangées dans le répertoire xsl.
* Un framework de mise en page pour le site web [Materialize](http://materializecss.com/).
* une requête XQuery.
* un code java (fichiers .java et .class).

## Utilisation

Le répertoire comprend un _Makefile_ qui permet d'effectuer toute les opérations :

* `$ make donneetomaster` qui permet de prendre toutes les donnnées du master fournies
 par notre enseignant en un fichier _master.xml_ conforme a notre _dtd_ (via xslt).

* `$ make dtd` qui vérifie que le fichier _master.xml_ soit conforme à la _dtd_.

* `$ make xsd` qui vérifie que le fichier _master.xml_ soit conforme au _schéma_.

* `$ make web` qui génère le site web dans le répertoire _www_.

* `$ make tidy` qui vérifie que toutes les pages du site web sont conforme aux normes.

* `$ make xq` qui exécute la requète XQuery du fichier _xq.txt_

* `$ make java` qui va lire le fichier XML de données et en extraire les noms des
 unités d'enseignement. Le résultat est donné sur la sortie standard sous la
 forme d'un document XML codé en mémoire (arbre DOM) et sérialisé.

* `$ make` qui exécute toute les règles précédentes.
