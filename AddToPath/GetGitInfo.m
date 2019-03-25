%[version_info] = GetGitVersion
%
%Returns a structure (git_info) containing:
%-location of git directory
%-current branch
%-latest commit id on current branch
%-log from current branch
%-timestamp for time of call
function [git_info] = GetGitInfo

%find git directory
directory_search = [pwd filesep];
while 1
    %search
    git_info.directory_git = [directory_search '.git' filesep];
    if exist(git_info.directory_git, 'dir')
        break;
    end
    
    %not found - look in parent dir
    fileseps = find(directory_search==filesep);
    if length(fileseps) <= 1
        %stop if no more parent directories to search
        error('The current directory does not appear to be part of a git repo!')
    else
        directory_search = directory_search(1:fileseps(end-1));
    end
end

%check current branch
contents = textread([git_info.directory_git 'HEAD'], '%s');
git_info.branch = contents{2};

%get latest commit id on current branch
git_info.latest_commit = fileread([git_info.directory_git git_info.branch]);

%copy log
git_info.log = fileread([git_info.directory_git 'logs' filesep git_info.branch]);

%timestamp (HH-MM-SS_DD-MM_YYYY) for current time
c = round(clock);
git_info.timestamp = sprintf('%02d-%02d-%02d_%02d-%02d_%d',c([4 5 6 3 2 1]));
