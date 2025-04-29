function __fish_git_branch_rm
  if git rev-parse --is-inside-work-tree &>/dev/null
    complete -c git-branch-rm --no-files -a "(git branch | cut -c 3-)"
  end
end

__fish_git_branch_rm
