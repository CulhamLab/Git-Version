%[directory] = GetGitDir
%
%Searches for the main git directory. Returns NaN if thecurrent directory
%does not appear to be part of a git repo.
function [directory] = GetGitDir

%find git directory
directory_search = [pwd filesep];
while 1
    %search
    directory = [directory_search '.git' filesep];
    if exist(directory, 'dir')
        break;
    end
    
    %not found - look in parent dir
    fileseps = find(directory_search==filesep);
    if length(fileseps) <= 1
        %stop if no more parent directories to search
        directory = nan;
        return;
    else
        directory_search = directory_search(1:fileseps(end-1));
    end
end