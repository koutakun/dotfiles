#!/bin/bash
set -eu

cwd=`dirname "${0}"`
DOTFILES_PATH=`(cd "${cwd}" && pwd)`

echo "                __          __     ____    _     __                   "
echo "           ____/ /  ____   / /_   / __/   (_)   / /  ___    _____     "
echo "         / __   /  / __ \ / __/  / /_    / /   / /  / _ \  / ___/      "
echo "        / /_/  /  / /_/ // /_   / __/   / /   / /  /  __/ (__  )      "
echo "         \__,_/   \____/ \__/  /_/     /_/   /_/   \___/ /____/       "

echo "dotfile_path = ${DOTFILES_PATH}"

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -snfv ${DOTFILES_PATH}/"${f}" ~/"${f}"
done


#バイナリファイルのリンクを作成する
MY_BIN_DIR = "bin"
BIN_PATH = "/local/bin"
do f in ${MY_BIN_DIR}.*
    ln -snfv ${MY_BIN_DIR}/"${f}" ${BIN_PATH}/"${f}"
done


echo ""
