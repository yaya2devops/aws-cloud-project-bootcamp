# Vim Keybindings Exposure On Bootcamp

[Why, why, why...](https://raw.githubusercontent.com/yaya2devops/aws-cloud-project-bootcamp/main/journal/assets/week8/memes/337017785_1051893609101184_1193362582954280787_n.png)

Me loving VIM and the moves.

1. **Installation and Activation:**
   - Open VS Code.
   - Go to the Extensions view by clicking on the square icon on the sidebar or pressing `Ctrl` + `Shift` + `X`.
   - Search for "Vim" in the extensions search bar.
   - Install the "Vim" extension by vscodevim.
   - Once installed, the Vim extension should be active by default.

2. **Modes:**
   - **Normal Mode:** Default mode for navigation and manipulation.
   - **Insert Mode:** Mode for typing and editing text.
   - **Visual Mode:** Mode for selecting and manipulating text visually.

### Basic Navigation

- **Normal Mode Navigation:**
  - `h`, `j`, `k`, `l`: Move left, down, up, and right, respectively.
  - `w`, `b`: Move forward and backward by word.
  - `0`, `$`: Move to the start and end of a line, respectively.
  - `gg`, `G`: Move to the start and end of the file, respectively.
  - `Ctrl` + `u`, `Ctrl` + `d`: Scroll up and down half a page.
  - `Ctrl` + `b`, `Ctrl` + `f`: Scroll up and down a full page.

- **Insert Mode Navigation:**
  - `Ctrl` + `o`: Temporarily enter Normal Mode for a single command.

### Text Manipulation

- **Insert Mode Editing:**
  - `i`: Enter insert mode before the cursor.
  - `I`: Enter insert mode at the beginning of the line.
  - `a`: Enter insert mode after the cursor.
  - `A`: Enter insert mode at the end of the line.
  - `o`: Open a new line below and enter insert mode.
  - `O`: Open a new line above and enter insert mode.

- **Deleting and Copying:**
  - `x`: Delete character under cursor.
  - `dd`: Delete (cut) the current line.
  - `yy`: Copy (yank) the current line.
  - `p`: Paste the yanked or deleted text after the cursor.
  - `P`: Paste before the cursor.

- **Undo and Redo:**
  - `u`: Undo the last action.
  - `Ctrl` + `r`: Redo an undone action.

### Visual Mode

- **Entering Visual Mode:**
  - `v`: Start visual mode, allowing you to select text character by character.
  - `V`: Start visual mode, selecting whole lines at a time.
  - `Ctrl` + `v`: Start visual mode, selecting text in a block.

- **Visual Mode Commands:**
  - After selecting, you can use movement keys to expand the selection.
  - Press `d`, `y`, or other commands to delete, copy, etc., the selected text.

### Searching and Replacing

- **Search:**
  - `/`: Search for text (type, press `Enter`, and use `n` and `N` to navigate search results).

- **Replace:**
  - `:%s/old/new/g`: Replace all occurrences of "old" with "new" in the entire file.

### Saving and Exiting

- **Saving:**
  - `:w`: Save the file.

- **Exiting:**
  - `:q`: Close the file.
  - `:q!`: Close the file without saving changes.
  - `:wq` or `ZZ`: Save and close the file.

### Customization

- You can customize the behavior of the Vim extension by modifying its settings. To access settings, go to "File" > "Preferences" > "Settings" and search for "Vim."

## Resource Killers!

- [Vim Cheat Sheet](https://vim.rtorr.com/)
- [Vim Adventures](https://vim-adventures.com/)
