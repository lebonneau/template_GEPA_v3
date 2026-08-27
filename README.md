# template_GEPA_v3
Quand tu veux suivre exactement les règles du GÉPA v3, voici un modèle au format LaTeX exportable en .pdf et .docx

Ce projet reproduit les exigences matérielles obligatoires du *Guide et conseils de présentation des travaux écrits de l'École de politique appliquée (GÉPA), version 3, 15 juin 2026*.


## Démarrage sur Overleaf (ou tout autre logiciel utilisant le langage LaTeX)

1. Téléversez le fichier ZIP dans Overleaf avec **New Project > Upload Project**.
2. Dans **Menu > Compiler**, choisissez **XeLaTeX**.
3. Modifiez les renseignements de la page titre dans `Page titre.tex`.
4. Écrivez votre travail dans `écris_ici.tex`.
5. Ajoutez vos références dans `references.bib` (un export BibTeX de Zotero peut remplacer ce fichier).
6. Compilez au moins deux fois; Overleaf exécute automatiquement Biber pour les références APA et actualise les tables.

## Déclaration de l'utilisation d'une IA générative

Si une IA générative a contribué au travail, remplissez `Declaration IA.tex`, puis décommentez `\input{Declaration IA}` dans `main_doc.tex`. Pour un usage méthodologique, ajoutez aussi les précisions pertinentes dans la méthodologie. Vérifiez les règles propres à votre cours ou programme.

## Conformité intégrée

- papier Lettre US;
- marges de 2,5 cm sur les quatre côtés;
- Times 12 points;
- interligne 1,5, texte justifié et aucun alinéa;
- page titre sobre, non paginée mais comptée comme page 1;
- pagination en bas à droite, en 12 points;
- notes explicatives en 10 points, à interligne simple et alignées à gauche;
- citations de plus de trois lignes à interligne simple avec retraits de 2,5 cm des deux côtés;
- références bibliographiques à interligne simple, alignées à gauche et produites en APA 7e édition;
- tableaux et figures numérotés selon leur section, avec commande de source;
- ordre GÉPA des pages liminaires et annexes placées avant les références.

## Commandes utiles

- Citation parenthétique (Bonneau 2026) : `\parencite[33--40]{cle}`
- Citation narrative "Comme l'explique Bonneau (2026, 2) : `\textcite{cle}`
- Citation longue : `\begin{quote} ... \end{quote}` (la commande `gepacitationlongue` fonctionne aussi pour le PDF, mais `quote` se convertit mieux en DOCX)
- Note explicative : `\footnote{...}`
- Source d'un tableau ou d'une figure : `\source{Référence APA ou création de l'autrice ou de l'auteur.}`
- Sections non numérotées : ajoutez `\GEPANumerotationSansSections` après `\begin{document}`.
- Notes recommençant à 1 à chaque section-chapitre : ajoutez `\GEPAReinitialiserNotesParSection` après `\begin{document}`.

## Export PDF

Dans Overleaf, cliquez sur **Recompile**, puis **Download PDF**. L'ajout des fichiers Times New Roman assure la conformité littérale de la police.

## Export DOCX



## Ordre des pages

Le GÉPA prévoit, selon les besoins : page titre, résumé, remerciements, déclaration d'utilisation de l'IA au besoin, table des matières, autres tables, liste des acronymes, texte principal, annexes, puis références bibliographiques. Les lignes optionnelles correspondantes sont déjà placées dans `main_doc.tex`; il suffit de les décommenter.

## Vérification avant remise

Contrôlez une dernière fois les consignes particulières de la personne enseignante, la cohérence entre la table des matières et le texte, les droits de reproduction des figures, la présence des sources, l'ordre alphabétique des références et l'intégrité intellectuelle du travail.

## Crédits et attribution

Template créé par **Lé Bonneau** en 2026 avec l'assistance de **ChatGPT/Codex (OpenAI, GPT-5)** pour le code et la documentation. Il est adapté du *GÉPA, version 3* (Loiseau, 2026) et du guide de l'UdeS sur l'utilisation responsable de l'IA générative (Beaudet et Léger-Rousseau, 2025). Il ne s'agit pas d'un produit officiel de l'Université de Sherbrooke.
