# For visual editor, use Vim if it is available, else use vi.
if command -v vim >/dev/null 2>&1 ; then
  VISUAL='vim'
else
  VISUAL='vi'
fi
export VISUAL
