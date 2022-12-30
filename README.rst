##################################################################################
vim-jedipydoc - Show the Pydoc/Python Documentation of the item under the cursor
##################################################################################

Jedipydoc is a Vim plugin that allows showing the Pydoc documentation:
- In a new tab (Default),
- or in a horizontal split.

Default key mapping: ``<Leader>K``.

Author and license
===================
- Author: `James Cherti <https://www.jamescherti.com>`
- Jedipydoc GitHub repository: https://github.com/jamescherti/vim-jedipydoc
- License: MIT

Requirements
============

Jedipydoc requires `Jedi-vim <https://github.com/davidhalter/jedi-vim>`.

Change the default key mapping
==============================
Add the following lines to your ~/.vimrc if you wish to use the same key
mapping as Jedi-vim:

.. code-block:: vim

    let g:jedipydoc_documentation_command = 'K'
    let g:jedi#documentation_command = '<Leader>K'

Documentation
=============

Documentation is available in your vim: ``:help jedipydoc``.

Installation
============

Installation with Vim's built-in package manager (Vim 8 and above)
------------------------------------------------------------------

.. code-block:: sh

    bash
    mkdir -p ~/.vim/pack/jamescherti/start
    cd ~/.vim/pack/jamescherti/start
    git clone --depth 1 https://github.com/jamescherti/vim-jedipydoc
    vim -u NONE -c "helptags vim-jedipydoc/doc" -c q

Installation with a third-party plugin manager
----------------------------------------------

You might want to use `pathogen <https://github.com/tpope/vim-pathogen>`_ or
`Vundle <https://github.com/gmarik/vundle>`_ to install jedipydoc.

The first thing you need after that is an up-to-date version of Jedi. Install
``git submodule update --init --recursive`` in your jedipydoc repository.

Example installation command using Pathogen:

.. code-block:: sh

    git clone --recursive https://github.com/jamescherti/jedipydoc.git ~/.vim/bundle/jedipydoc
