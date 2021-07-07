%[is_git] = IsGitRepo
%
%Returns boolean (true/false) for whether the current directory is detected
%as a git repository.
function [is_git] = IsGitRepo
directory = GetGitDir;
is_git = ischar(directory);
    
