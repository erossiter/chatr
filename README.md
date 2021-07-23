
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
#>  $ id               : int 117
#>  $ name             : chr "My First Experiment"
#>  $ created_at       : chr "2021-07-23T21:47:29.641Z"
#>  $ updated_at       : chr "2021-07-23T21:47:29.641Z"
#>  $ post_survey_link : chr "http://erossiter.com/"
#>  $ moderator_message: chr "Welcome to the chat!"
#>  $ language         : chr "English"
#>  $ researcher_id    : int 4
```

We’ll note the experiment id. We’ll need it moving forward.

``` r
(experiment_id <- my_experiment$content$id)
#> [1] 117
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
#> [1] 3537
(control_id <- instruction_c$content$id)
#> [1] 3538
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
#> 1  2641  chatroom1  chatroom1 2021-07-23T21:47:29.892Z 2021-07-23T21:47:29.892Z
#> 2  2642  chatroom2  chatroom2 2021-07-23T21:47:29.954Z 2021-07-23T21:47:29.954Z
#> 3  2643  chatroom3  chatroom3 2021-07-23T21:47:30.023Z 2021-07-23T21:47:30.023Z
#> 4  2644  chatroom4  chatroom4 2021-07-23T21:47:30.086Z 2021-07-23T21:47:30.086Z
#> 5  2645  chatroom5  chatroom5 2021-07-23T21:47:30.156Z 2021-07-23T21:47:30.156Z
#> 6  2646  chatroom6  chatroom6 2021-07-23T21:47:30.218Z 2021-07-23T21:47:30.218Z
#> 7  2647  chatroom7  chatroom7 2021-07-23T21:47:30.283Z 2021-07-23T21:47:30.283Z
#> 8  2648  chatroom8  chatroom8 2021-07-23T21:47:30.345Z 2021-07-23T21:47:30.345Z
#> 9  2649  chatroom9  chatroom9 2021-07-23T21:47:30.413Z 2021-07-23T21:47:30.413Z
#> 10 2650 chatroom10 chatroom10 2021-07-23T21:47:30.475Z 2021-07-23T21:47:30.475Z
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
#>  [1] 2641 2642 2643 2644 2645 2646 2647 2648 2649 2650
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
#>      id  username               created_at               updated_at role
#> 1  3917 Moderator 2021-07-23T21:12:40.123Z 2021-07-23T21:12:40.123Z   NA
#> 2  3918     user1 2021-07-23T21:47:30.623Z 2021-07-23T21:47:30.623Z   NA
#> 3  3919     user2 2021-07-23T21:47:30.683Z 2021-07-23T21:47:30.683Z   NA
#> 4  3920     user3 2021-07-23T21:47:30.744Z 2021-07-23T21:47:30.744Z   NA
#> 5  3921     user4 2021-07-23T21:47:30.804Z 2021-07-23T21:47:30.804Z   NA
#> 6  3922     user5 2021-07-23T21:47:30.867Z 2021-07-23T21:47:30.867Z   NA
#> 7  3923     user6 2021-07-23T21:47:30.926Z 2021-07-23T21:47:30.926Z   NA
#> 8  3924     user7 2021-07-23T21:47:30.987Z 2021-07-23T21:47:30.987Z   NA
#> 9  3925     user8 2021-07-23T21:47:31.047Z 2021-07-23T21:47:31.047Z   NA
#> 10 3926     user9 2021-07-23T21:47:31.107Z 2021-07-23T21:47:31.107Z   NA
#> 11 3927    user10 2021-07-23T21:47:31.169Z 2021-07-23T21:47:31.169Z   NA
#> 12 3928    user11 2021-07-23T21:47:31.248Z 2021-07-23T21:47:31.248Z   NA
#> 13 3929    user12 2021-07-23T21:47:31.309Z 2021-07-23T21:47:31.309Z   NA
#> 14 3930    user13 2021-07-23T21:47:31.376Z 2021-07-23T21:47:31.376Z   NA
#> 15 3931    user14 2021-07-23T21:47:31.436Z 2021-07-23T21:47:31.436Z   NA
#> 16 3932    user15 2021-07-23T21:47:31.500Z 2021-07-23T21:47:31.500Z   NA
#> 17 3933    user16 2021-07-23T21:47:31.562Z 2021-07-23T21:47:31.562Z   NA
#> 18 3934    user17 2021-07-23T21:47:31.625Z 2021-07-23T21:47:31.625Z   NA
#> 19 3935    user18 2021-07-23T21:47:31.685Z 2021-07-23T21:47:31.685Z   NA
#> 20 3936    user19 2021-07-23T21:47:31.747Z 2021-07-23T21:47:31.747Z   NA
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
#>  [1] 3917 3918 3919 3920 3921 3922 3923 3924 3925 3926 3927 3928 3929 3930 3931
#> [16] 3932 3933 3934 3935 3936
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
#> 1  3798    3926        2645 2021-07-23T21:47:32.582Z 2021-07-23T21:47:32.582Z
#> 2  3797    3925        2645 2021-07-23T21:47:32.512Z 2021-07-23T21:47:32.512Z
#> 3  3796    3924        2644 2021-07-23T21:47:32.440Z 2021-07-23T21:47:32.440Z
#> 4  3795    3923        2644 2021-07-23T21:47:32.369Z 2021-07-23T21:47:32.369Z
#> 5  3794    3922        2643 2021-07-23T21:47:32.302Z 2021-07-23T21:47:32.302Z
#> 6  3793    3921        2643 2021-07-23T21:47:32.232Z 2021-07-23T21:47:32.232Z
#> 7  3792    3920        2642 2021-07-23T21:47:32.162Z 2021-07-23T21:47:32.162Z
#> 8  3791    3919        2642 2021-07-23T21:47:32.098Z 2021-07-23T21:47:32.098Z
#> 9  3790    3918        2641 2021-07-23T21:47:32.029Z 2021-07-23T21:47:32.029Z
#> 10 3789    3917        2641 2021-07-23T21:47:31.965Z 2021-07-23T21:47:31.965Z
#> 11 3808    3936        2650 2021-07-23T21:47:33.263Z 2021-07-23T21:47:33.263Z
#> 12 3807    3935        2650 2021-07-23T21:47:33.195Z 2021-07-23T21:47:33.195Z
#> 13 3806    3934        2649 2021-07-23T21:47:33.129Z 2021-07-23T21:47:33.129Z
#> 14 3805    3933        2649 2021-07-23T21:47:33.063Z 2021-07-23T21:47:33.063Z
#> 15 3804    3932        2648 2021-07-23T21:47:32.997Z 2021-07-23T21:47:32.997Z
#> 16 3803    3931        2648 2021-07-23T21:47:32.917Z 2021-07-23T21:47:32.917Z
#> 17 3802    3930        2647 2021-07-23T21:47:32.848Z 2021-07-23T21:47:32.848Z
#> 18 3801    3929        2647 2021-07-23T21:47:32.780Z 2021-07-23T21:47:32.780Z
#> 19 3800    3928        2646 2021-07-23T21:47:32.716Z 2021-07-23T21:47:32.716Z
#> 20 3799    3927        2646 2021-07-23T21:47:32.648Z 2021-07-23T21:47:32.648Z
#>    display_name instruction_id
#> 1         2kaKt           3537
#> 2         MpPRk           3537
#> 3         ECEaA           3537
#> 4         f0kzs           3537
#> 5         W7ikB           3537
#> 6         CcBp5           3537
#> 7         orRgb           3537
#> 8         M6Uq4           3537
#> 9         iJSVU           3537
#> 10        ZrQgI           3537
#> 11        TYtnL           3538
#> 12        wSsH8           3538
#> 13        4eev4           3538
#> 14        yvnMi           3538
#> 15        yvXvR           3538
#> 16        BF4l9           3538
#> 17        lbjeN           3538
#> 18        ixpaL           3538
#> 19        iH4Gr           3538
#> 20        Naahs           3538
```

### Other functionality

  - `create` create an entry
  - `update` update field(s) for an entry
  - `retrieve` retrieve an entry
  - `list` list all entries
  - `delete` delete an entry (you can delete this example with the
    following code)

<!-- end list -->

``` r
for (i in 1:length(chatroom_id)) {
  try(delete_chatroom(bearer_token, chatroom_id[i]))
}
for (i in 1:length(user_id)) {
  try(delete_user(bearer_token, user_id[i]))
}
for (i in 1:length(my_chatroom_memberships$content$id)) {
  try(delete_chatroom_membership(bearer_token,
      my_chatroom_memberships$content$id[i]))
}
try(delete_instruction(bearer_token, instruction_id = treatment_id))
try(delete_instruction(bearer_token, instruction_id = control_id))
try(delete_experiment(bearer_token, experiment_id))
```

# In practice

There are many ways to use Chatter in practice.

  - You could collect pre-treatment information and set up chatrooms
    amongst specific participants. Here, you could email participants a
    specific link to join.
  - You could have participants create their own Chatter account (and
    thus pick their own username), and use the API to assign them to
    chatrooms (with a script in real time or not.)
  - You could reprogram an experiment and feed participants into the
    chatrooms in real time as they are taking your survey.
  - etc.

Here, I’ll discuss two broad options for using Chatter. Participants are
assigned pre-specified chatrooms, or participants are assigned chatrooms
by convenience as they are available. I’ll demonstrate both with the
Qualtrics survey platform.

In either of these cases, deeplinks are useful. Deeplinks to Chatter
take the following form.\[1\]

`http://chatter-washu.herokuapp.com/deeplink?user=<username>&room=<chatroom_id`

If you didn’t delete the example experiment created above, you can use
the following deeplink to see.

`http://chatter-washu.herokuapp.com/deeplink?user=user1&room=2631`

## Coordinated chats

If you’d like to coordinate chats amongst specific users, hopefully you
can see how the deeplinks are useful\!

If you are able to email users, you can email them their specific
deeplink.

If users know the username you’ve created for them (perhaps on MTurk it
is their MTurk id), they can login easily themselves using the Chatter
interface.

Or, you can redirect from a Qualtrics survey. It’s three simple steps.
First, create your question where you ask participants for their unique
identifier (that you already know from the pre-treatment survey and was
used to set up chatrooms).

Second, prepare to edit the URL users are redirected to at the end of
the survey. Edit end of survey \> End of survey message \> Redirect to
URL.

Third, paste the deeplink there with [piped
text](https://www.qualtrics.com/support/survey-platform/survey-module/editing-questions/piped-text/piped-text-overview/),
grabbing the user’s id from the Qualtrics question you just created.
`http://chatter-washu.herokuapp.com/deeplink?user=${q://QID1/ChoiceTextEntryValue}`

TODO: screenshot here

## Real-time chats

Real-time chats can be created with deeplinks, too. Again, you need to
create an experiment just as we did before. The difference is that you
will not know ahead of time exactly which participant will be filtered
into each chatroom.

In Qualtrics, the idea is to increment an embedded data variable each
time someone completes the survey. If I’m the first participant to
finish the survey, I’m “user1” and it is already programmed that I am
filtered into “chatroom1”. The next person completes the survey, they
are “user2”, and join me in “chatroom1”.

TODO: When I get my Qualtrics account back I have an example of this.
<https://www.qualtrics.com/support/survey-platform/survey-module/survey-tools/quotas/#UsingQuotasInOtherPartsOfQualtrics>

`http://chatter-washu.herokuapp.com/deeplink?user=EMBEDDED_DATA`

TODO: A more advance feature is real-time chats with a script prepared
to make chatrooms on the fly…

1.  The `room` field is optional. Specifying the `room` field will bring
    a user *into* the chat, without this field the user will see a list
    of chatrooms they are assigned to and click on one.
