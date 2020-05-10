" Vim configuration
" from https://vimebook.com/static/fr-vim-extract-chap1.pdf


" Annule la compatibilite avec l’ancetre Vi : totalement indispensable
set nocompatible

" -- Affichage
set title		" Met à jour le titre de la fenêtre ou terminal
set number		" Affiche numéro des lignes
set ruler		" Affiche la position actuelle du curseur
set wrap		" Affiche les lignes trop longues sur plusieurs lignes
set scrolloff=3		" Affichge un min de 3 lignes autour du curseur pour le scroll

" -- Recherche
set ignorecase
set smartcase		" Si une recherche contient une majuscule, re-active la sensibilité à la casse
set incsearch		" Surligne les résultats de recherche pendant la saisie
set hlsearch		" Surligne les résultats de recherche

" -- Beep
set visualbell		" Empêche Vim de beeper
set noerrorbells	" Empêche Vim de beeper


 " Active le comportement ’habituel’ de la touche retour en arriere
set backspace=indent,eol,start

" Cache les fichiers lors de l’ouverture d’autres fichiers
set hidden 

syntax enable
" Active les comportements specifiques aux types de fichiers comme
" la syntaxe et l’indentation
filetype on
filetype plugin on
filetype indent on


" Utilise la version sombre de Solarized
set background=light
colorscheme solarized

set guifont=Monaco:h13
set antialias

set encoding=utf-8 " the encoding displayed
set fileencoding=utf-8 " the encoding written to file


" hightlight whitespace chars
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list



