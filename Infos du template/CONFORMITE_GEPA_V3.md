# Fiche de conformité au GÉPA, version 3

Référence contrôlée : Hugo Loiseau, *Guide et conseils de présentation des travaux écrits de l'École de politique appliquée (GÉPA) Version 3*, 15 juin 2026.

| Exigence du GÉPA v3 | Mise en œuvre |
|---|---|
| Lettre US, 21,5 × 28 cm | Classe `letterpaper`; sorties vérifiées à 612 × 792 points |
| Marges de 2,5 cm | Verrouillées dans `gepa.cls` et dans `reference-gepa.docx` |
| En-tête et bas de page à 1,5 cm | Paramétrés dans les sorties PDF et DOCX |
| Times New Roman 12 | Vraie police chargée depuis `fonts/`; mode `strictfont` disponible |
| Corps à interligne 1,5 | Appliqué globalement |
| Texte justifié | Appliqué au corps et aux citations longues |
| Aucun alinéa | Retrait de première ligne fixé à zéro |
| Numéro de page en bas à droite, même police et taille | Appliqué; page titre non affichée et page suivante numérotée 2 |
| Notes explicatives en taille 10, interligne simple, à gauche | Appliqué aux notes infrapaginales |
| Citation de plus de trois lignes, simple, retraits de 2,5 cm | Environnement `quote` configuré automatiquement |
| Références à interligne simple et à gauche | Appliqué à la bibliographie PDF et au style DOCX |
| APA 7e édition en français | `biblatex-apa` et Biber sur Overleaf; Pandoc `citeproc` pour le DOCX |
| Page titre : institution, titre et sous-titre italiques, auteur·trice(s), destinataire, cours, lieu et date | Commande `\maketitlegepa` et post-traitement DOCX |
| Page titre non paginée, mais comptée | Appliqué dans les deux formats |
| Ordre des pages liminaires | Commandes optionnelles déjà placées dans le bon ordre dans `main.tex` |
| Table des matières recensée dans elle-même | Automatique en PDF; champ à actualiser dans Word |
| Tables des tableaux et figures, au besoin | Commandes optionnelles fournies |
| Sections numérotées ou non, mais cohérentes | Deux modes fournis |
| Tableaux et figures numérotés de façon cohérente | Numérotation liée aux sections et références croisées |
| Titre et source des tableaux/figures | Commande `\source{...}` et exemple convertible |
| Annexes avant les références | Emplacement préparé et commenté dans `main.tex` |

## Choix laissés ouverts par le guide

Le GÉPA autorise la numérotation ou non des sections et sous-sections, ainsi que plusieurs organisations des tables liminaires. Le template propose des commandes explicites afin que le choix demeure uniforme dans tout le travail.

## Condition pour une conformité littérale de la police

Times New Roman est propriétaire et ne peut pas être redistribuée dans cette archive. Sans les quatre fichiers placés dans `fonts/`, la classe emploie une police Times de repli et émet un avertissement. Activez `strictfont` après avoir ajouté vos fichiers pour garantir qu'aucun PDF ne soit produit avec une autre police.

