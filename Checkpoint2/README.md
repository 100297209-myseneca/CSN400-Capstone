# Checkpoint2 Submission

- **COURSE INFORMATION: CSN400NDD**
- **STUDENT’S NAME: Md Saiful Islam**
- **STUDENT'S NUMBER: 100297209**
- **GITHUB USER ID: 100297209-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

---

### Table of Contents


1. [Part A: Adding files, local repo workflow.](#part-a-adding-files-local-repo-workflow)
2. [Part B: Inspecting local repo with git status and git log](#part-b-inspecting-local-repo-with-git-status-and-git-log)
3. [Part C: Creating and Merging branches.](#part-c-creating-and-merging-branches)
4. [Part D: Git branching strategy review questions.](#part-d-git-branching-strategy-review-questions)


### Part A: adding files, local repo workflow.

```
$ git log -n 5
commit 65801363d35ea1db52f92904b55b75c782aaa140 (HEAD -> main, origin/main, origin/HEAD)
Author: msislam40 <msislam40@myseneca.ca>
Date:   Thu Jan 26 21:59:45 2023 -0500

    adds text files for CP2 submission

commit f05b763c9c0577abd1a932200dace35ec3a5b180
Author: msislam40 <msislam40@myseneca.ca>
Date:   Thu Jan 26 21:56:36 2023 -0500

    adds Checkpoint2/README.md

commit 6067ef3c63565a522fd93a7de53e95323dc45d80
Author: msislam40 <msislam40@myseneca.ca>
Date:   Thu Jan 26 21:42:36 2023 -0500

    adds CP2/README.md

commit 787c0320da1ea57e5cd16108dd2e784ba8f90bea
Author: msislam40 <msislam40@myseneca.ca>
Date:   Thu Jan 26 21:36:47 2023 -0500

    adds CP2/README.md

commit 5abdf79656de9e7c1123c7cdd47211d75446e710
Author: 100297209-myseneca <122843163+100297209-myseneca@users.noreply.github.com>
Date:   Tue Jan 17 20:42:08 2023 -0500

    Update README.md
```

### Part B: Inspecting Local Repo with git status and git log.

```
Git Status is a helpful command that we could use to learn more about the branch we're working on right now.also:


1.If this branch is the most recent,
2.Any  tracked, or untracked files
3.Any newly created, updated, or removed files
4.Push or pull also if there is anything to commit.

Git log will show the current  branch's commit history.We can have thousands of commit history.
```

### Part C: Creating and Merging Branches.

#### Main Branch 


#### Feat-emojis Branch


``` 
$ git log -n 5
commit 2a86584dcaf30bb1b063fef038aab3862e227043 (HEAD -> main, origin/main, origin/feat-emojis, origin/HEAD, feat-emojis)
Author: msislam40 <msislam40@myseneca.ca>
Date:   Thu Jan 26 22:14:53 2023 -0500

    adds emojis to feat-emojis branch

commit 9402f0e1e6b635e20c3aaa8e090386bb31a43538
Author: msislam40 <msislam40@myseneca.ca>
Date:   Thu Jan 26 22:07:55 2023 -0500

    adds footnotes folder

commit 65801363d35ea1db52f92904b55b75c782aaa140
Author: msislam40 <msislam40@myseneca.ca>
Date:   Thu Jan 26 21:59:45 2023 -0500

    adds text files for CP2 submission

commit f05b763c9c0577abd1a932200dace35ec3a5b180
Author: msislam40 <msislam40@myseneca.ca>
Date:   Thu Jan 26 21:56:36 2023 -0500

    adds Checkpoint2/README.md

commit 6067ef3c63565a522fd93a7de53e95323dc45d80
Author: msislam40 <msislam40@myseneca.ca>
Date:   Thu Jan 26 21:42:36 2023 -0500

    adds CP2/README.md
```

### Part D: Git Branching Strategy Review Questions.

```
1.The main branch in a repository is often referred to as the primary or default  branch.Before features are integrated into the main branch, developers work on them on a different branch called the develop branch.
2.Feature, hotfix, and release branches are the three supporting branches. Prior to being merged into the main branch, a specific feature is tested on a feature branch. Without having to wait or wastime time for the future releases, a problem on the main branch may be promptly fixed using a hotfix branch. Before being merged into the main branch, a release is prepared on a release branch.
3.A different branch should be created for each release, and each branch should be tested before being merged into the main branch.Once release branches have been merged with the main branch, they should be deleted.

