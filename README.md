
<!-- README.md is generated from README.Rmd. Please edit that file -->

# chatr

<!-- badges: start -->

<!-- badges: end -->

The goal of chatr is to allow researchers to easily set up Chatter
experiments.

To get started, visit
[Chatter](http://chatter-washu.herokuapp.com/research/sign_in) and sign
up for a researcher account. You’ll receive an email when your account
is approved.

Log in and find your API credentials. You’ll need the Token for any
calls you make to Chatter with `chatr`. I recommend saving it as a
variable.

``` r
bearer_token <- "your token here"
```

## Installation

You can install the `chatr` package from Github.

``` r
#install.packages("devtools")
devtools::install_github("erossiter/chatr")
```

After install, you should load the package.

``` r
library(chatr)
```

## Example

Running an experiment with `chatr` requires seven basic steps. I’ll walk
through a basic example here.

1.  Create an experiment
2.  Create instructions
3.  Create chatrooms
4.  Create users
5.  Create chatroom memberships
6.  Run the experiment
7.  Download results

### Create an experiment

First, you create an experiment with the `create_experiment` function.
All that is required is a name for the experiment, but here I also
supply a link users are redirected to when clicking the “Done” button
among other arguments.

``` r
my_experiment <- create_experiment(bearer_token = bearer_token,
                                   name = "My First Experiment",
                                   post_survey_link = "http://erossiter.com/",
                                   moderator_message = "Welcome to the chat!",
                                   language = "English")
my_experiment
#> <Chatter /research/experiments.json>
#> Status: success
#> Error: none
#> 'data.frame':    1 obs. of  8 variables:
#>  $ id               : int 115
#>  $ name             : chr "My First Experiment"
#>  $ created_at       : chr "2021-07-23T20:46:53.690Z"
#>  $ updated_at       : chr "2021-07-23T20:46:53.690Z"
#>  $ post_survey_link : chr "http://erossiter.com/"
#>  $ moderator_message: chr "Welcome to the chat!"
#>  $ language         : chr "English"
#>  $ researcher_id    : int 4
```

We’ll note the experiment id. We’ll need it moving forward.

``` r
(experiment_id <- my_experiment$content$id)
#> [1] 115
```

### Create instructions

Next, we create instructions for our users. For this experiment, I have
two unique instructions. Users will be assigned to either the treatment
or control instructions. Both as associated with the experiment we just
created via the experiment id.

``` r
instruction_t <- create_instruction(bearer_token = bearer_token,
                   experiment_id = experiment_id,
                   name = "Treatment",
                   text = "Please talk about X.")

instruction_c <- create_instruction(bearer_token = bearer_token,
                   experiment_id = experiment_id,
                   name = "Control",
                   text = "Please talk about Y.")
```

We’ll note the instruction ids as well.

``` r
(treatment_id <- instruction_t$content$id)
#> [1] 3533
(control_id <- instruction_c$content$id)
#> [1] 3534
```

### Create chatrooms

Next, let’s create ten chatrooms.

``` r
for(i in 1:10){
  create_chatroom(bearer_token = bearer_token,
                topic = paste0("chatroom", i),
                min_duration = 180)
}
```

We can see that our chatrooms have been created with another `chatr`
function: `list_chatrooms`. This function returns a list, and we’re
interested in the `content` element right now holding a dataframe with
information about our chatrooms.

``` r
my_chatrooms <- list_chatrooms(bearer_token = bearer_token)
my_chatrooms$content
#>      id      topic       slug               created_at               updated_at
#> 1  2621  chatroom1  chatroom1 2021-07-23T20:46:53.941Z 2021-07-23T20:46:53.941Z
#> 2  2622  chatroom2  chatroom2 2021-07-23T20:46:54.003Z 2021-07-23T20:46:54.003Z
#> 3  2623  chatroom3  chatroom3 2021-07-23T20:46:54.065Z 2021-07-23T20:46:54.065Z
#> 4  2624  chatroom4  chatroom4 2021-07-23T20:46:54.127Z 2021-07-23T20:46:54.127Z
#> 5  2625  chatroom5  chatroom5 2021-07-23T20:46:54.187Z 2021-07-23T20:46:54.187Z
#> 6  2626  chatroom6  chatroom6 2021-07-23T20:46:54.250Z 2021-07-23T20:46:54.250Z
#> 7  2627  chatroom7  chatroom7 2021-07-23T20:46:54.318Z 2021-07-23T20:46:54.318Z
#> 8  2628  chatroom8  chatroom8 2021-07-23T20:46:54.380Z 2021-07-23T20:46:54.380Z
#> 9  2629  chatroom9  chatroom9 2021-07-23T20:46:54.443Z 2021-07-23T20:46:54.443Z
#> 10 2630 chatroom10 chatroom10 2021-07-23T20:46:54.507Z 2021-07-23T20:46:54.507Z
#>    min_duration max_duration finish_time researcher_id
#> 1           180           NA          NA             4
#> 2           180           NA          NA             4
#> 3           180           NA          NA             4
#> 4           180           NA          NA             4
#> 5           180           NA          NA             4
#> 6           180           NA          NA             4
#> 7           180           NA          NA             4
#> 8           180           NA          NA             4
#> 9           180           NA          NA             4
#> 10          180           NA          NA             4
```

We’ll note the chatroom ids.

``` r
(chatroom_id <- my_chatrooms$content$id)
#>  [1] 2621 2622 2623 2624 2625 2626 2627 2628 2629 2630
```

### Create users

Next we’ll create 20 users and check them out.

``` r
for(i in 1:20){
  create_user(bearer_token = bearer_token,
              username = paste0("user", i))
}
```

``` r
my_users <- list_users(bearer_token)
my_users$content
#>      id username               created_at               updated_at role
#> 1  3877    user1 2021-07-23T20:46:54.658Z 2021-07-23T20:46:54.658Z   NA
#> 2  3878    user2 2021-07-23T20:46:54.721Z 2021-07-23T20:46:54.721Z   NA
#> 3  3879    user3 2021-07-23T20:46:54.781Z 2021-07-23T20:46:54.781Z   NA
#> 4  3880    user4 2021-07-23T20:46:54.841Z 2021-07-23T20:46:54.841Z   NA
#> 5  3881    user5 2021-07-23T20:46:54.906Z 2021-07-23T20:46:54.906Z   NA
#> 6  3882    user6 2021-07-23T20:46:54.966Z 2021-07-23T20:46:54.966Z   NA
#> 7  3883    user7 2021-07-23T20:46:55.043Z 2021-07-23T20:46:55.043Z   NA
#> 8  3884    user8 2021-07-23T20:46:55.103Z 2021-07-23T20:46:55.103Z   NA
#> 9  3885    user9 2021-07-23T20:46:55.162Z 2021-07-23T20:46:55.162Z   NA
#> 10 3886   user10 2021-07-23T20:46:55.225Z 2021-07-23T20:46:55.225Z   NA
#> 11 3887   user11 2021-07-23T20:46:55.291Z 2021-07-23T20:46:55.291Z   NA
#> 12 3888   user12 2021-07-23T20:46:55.393Z 2021-07-23T20:46:55.393Z   NA
#> 13 3889   user13 2021-07-23T20:46:55.464Z 2021-07-23T20:46:55.464Z   NA
#> 14 3890   user14 2021-07-23T20:46:55.525Z 2021-07-23T20:46:55.525Z   NA
#> 15 3891   user15 2021-07-23T20:46:55.590Z 2021-07-23T20:46:55.590Z   NA
#> 16 3892   user16 2021-07-23T20:46:55.763Z 2021-07-23T20:46:55.763Z   NA
#> 17 3893   user17 2021-07-23T20:46:55.985Z 2021-07-23T20:46:55.985Z   NA
#> 18 3894   user18 2021-07-23T20:46:56.119Z 2021-07-23T20:46:56.119Z   NA
#> 19 3895   user19 2021-07-23T20:46:56.267Z 2021-07-23T20:46:56.267Z   NA
#> 20 3896   user20 2021-07-23T20:46:56.395Z 2021-07-23T20:46:56.395Z   NA
#>    signed_in experiment_finished_at researcher_id
#> 1         NA                     NA             4
#> 2         NA                     NA             4
#> 3         NA                     NA             4
#> 4         NA                     NA             4
#> 5         NA                     NA             4
#> 6         NA                     NA             4
#> 7         NA                     NA             4
#> 8         NA                     NA             4
#> 9         NA                     NA             4
#> 10        NA                     NA             4
#> 11        NA                     NA             4
#> 12        NA                     NA             4
#> 13        NA                     NA             4
#> 14        NA                     NA             4
#> 15        NA                     NA             4
#> 16        NA                     NA             4
#> 17        NA                     NA             4
#> 18        NA                     NA             4
#> 19        NA                     NA             4
#> 20        NA                     NA             4
```

And, we’ll again note the ids.

``` r
(user_id <- my_users$content$id)
#>  [1] 3877 3878 3879 3880 3881 3882 3883 3884 3885 3886 3887 3888 3889 3890 3891
#> [16] 3892 3893 3894 3895 3896
```

### Create chatroom memberships

Finally, we need to tie it all together. We need to create chatroom
memberships, and we do so by assigning users and instructions to
chatrooms. To help visualize what we’re doing ahead of time, let’s
create a dataframe where each row is a user, and we note which chatroom
they’re assigned to and which instruction they should see.

We’ll also give each user an optional display name that others in the
chatroom see alongside the user’s messages.

``` r
# each row is a user
exp <- data.frame(user_id = user_id)

# consecutive users are put in a chatroom together
exp$chatroom_id <- rep(chatroom_id, each = 2)

# the first five chatrooms are in the treatment,
# the last five are in the control
exp$instruction_id <- rep(c(treatment_id, control_id), each = 10)

# display names
exp$display_name <- stringi::stri_rand_strings(20, 5)
```

Finally, we tell Chatter.

``` r
for(i in 1:nrow(exp)){
  create_chatroom_membership(bearer_token = bearer_token,
                           user_id = exp$user_id[i],
                           chatroom_id = exp$chatroom_id[i],
                           instruction_id = exp$instruction_id[i],
                           display_name = exp$display_name[i])
}
```

``` r
my_chatroom_memberships <- list_chatroom_memberships(bearer_token)
my_chatroom_memberships$content
#>      id user_id chatroom_id               created_at               updated_at
#> 1  3758    3886        2625 2021-07-23T20:46:58.477Z 2021-07-23T20:46:58.477Z
#> 2  3757    3885        2625 2021-07-23T20:46:58.299Z 2021-07-23T20:46:58.299Z
#> 3  3756    3884        2624 2021-07-23T20:46:58.145Z 2021-07-23T20:46:58.145Z
#> 4  3755    3883        2624 2021-07-23T20:46:57.970Z 2021-07-23T20:46:57.970Z
#> 5  3754    3882        2623 2021-07-23T20:46:57.792Z 2021-07-23T20:46:57.792Z
#> 6  3753    3881        2623 2021-07-23T20:46:57.616Z 2021-07-23T20:46:57.616Z
#> 7  3752    3880        2622 2021-07-23T20:46:57.440Z 2021-07-23T20:46:57.440Z
#> 8  3751    3879        2622 2021-07-23T20:46:57.267Z 2021-07-23T20:46:57.267Z
#> 9  3750    3878        2621 2021-07-23T20:46:57.110Z 2021-07-23T20:46:57.110Z
#> 10 3749    3877        2621 2021-07-23T20:46:56.919Z 2021-07-23T20:46:56.919Z
#> 11 3768    3896        2630 2021-07-23T20:46:59.125Z 2021-07-23T20:46:59.125Z
#> 12 3767    3895        2630 2021-07-23T20:46:59.059Z 2021-07-23T20:46:59.059Z
#> 13 3766    3894        2629 2021-07-23T20:46:58.996Z 2021-07-23T20:46:58.996Z
#> 14 3765    3893        2629 2021-07-23T20:46:58.932Z 2021-07-23T20:46:58.932Z
#> 15 3764    3892        2628 2021-07-23T20:46:58.869Z 2021-07-23T20:46:58.869Z
#> 16 3763    3891        2628 2021-07-23T20:46:58.801Z 2021-07-23T20:46:58.801Z
#> 17 3762    3890        2627 2021-07-23T20:46:58.738Z 2021-07-23T20:46:58.738Z
#> 18 3761    3889        2627 2021-07-23T20:46:58.671Z 2021-07-23T20:46:58.671Z
#> 19 3760    3888        2626 2021-07-23T20:46:58.607Z 2021-07-23T20:46:58.607Z
#> 20 3759    3887        2626 2021-07-23T20:46:58.543Z 2021-07-23T20:46:58.543Z
#>    display_name instruction_id
#> 1         ndaBi           3533
#> 2         FsWyz           3533
#> 3         vx15i           3533
#> 4         B6mho           3533
#> 5         2Vf5T           3533
#> 6         GSfyA           3533
#> 7         yLO8C           3533
#> 8         ZDEf0           3533
#> 9         XZIz9           3533
#> 10        ulz0l           3533
#> 11        Aoeq0           3534
#> 12        debgd           3534
#> 13        5PraW           3534
#> 14        y7YCI           3534
#> 15        k9SG3           3534
#> 16        pxksb           3534
#> 17        S1m0D           3534
#> 18        1APcQ           3534
#> 19        hC5ag           3534
#> 20        96nsV           3534
```

### Delete

You can delete this example with similar calls to the API.

``` r
for(i in 1:length(chatroom_id)) try(delete_chatroom(bearer_token, chatroom_id[i]))
for(i in 1:length(user_id)) try(delete_user(bearer_token, user_id[i]))
for(i in 1:length(my_chatroom_memberships$content$id)){
  try(delete_chatroom_membership(bearer_token, my_chatroom_memberships$content$id[i]))
}
try(delete_instruction(bearer_token, instruction_id = treatment_id))
try(delete_instruction(bearer_token, instruction_id = control_id))
try(delete_experiment(bearer_token, experiment_id))
```
