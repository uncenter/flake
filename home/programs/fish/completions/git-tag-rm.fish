function __fish_git_tag_rm
  if git rev-parse --is-inside-work-tree &>/dev/null
    complete -c git-tag-rm --no-files -a "(git tag)"
  end
end

__fish_git_tag_rm
