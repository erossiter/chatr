test_that("create_experiment() works with defaults", {
  out <- create_experiment(name = "chatr test")
  expect_equal(out$status, "success")

  delete_experiment(out$content$id)

})

test_that("create_experiment() works for Spanish", {
  out <- create_experiment(name = "chatr test",
                           language = "Spanish")
  expect_equal(out$status, "success")

  delete_experiment(out$content$id)
})

test_that("create_instruction() throws error if experiment does not exist", {
  expect_error(create_instruction(name = "chatr test",
                                  experiment_id = 1,
                                  text = "test"))
})

test_that("create_instruction() works if experiment exists", {
  id <- create_experiment(name = "chatr test2")$content$id
  out <- create_instruction(name = "chatr instr test",
                            experiment_id = id,
                            text = "test")

  expect_equal(out$status, "success")

  delete_instruction(out$content$id)
})

test_that("create_chatroom() works", {
  out <- create_chatroom(topic = "chatr test")

  expect_equal(out$status, "success")

  delete_chatroom(out$content$id)
})

test_that("create_chatroom() throws error if chatroom name is not unique", {
  out <- create_chatroom(topic = "chatr test")

  expect_error(create_chatroom(topic = "chatr test"))

  delete_chatroom(out$content$id)
})

test_that("create_user() works", {
  out <- create_user(username = "chatr test")

  expect_equal(out$status, "success")

  delete_user(out$content$id)
})

# Create chatroom info for several tests
e_id <- create_experiment(name = "chatr test experiment")$content$id
i_id <- create_instruction(experiment_id = e_id,
                           name = "chatr test instruction",
                           text = "test")$content$id
u_id <- create_user(username = "chatr test user")$content$id
c_id <- create_chatroom(topic = "chatr test chatroom")$content$id

test_that("create_chatroom_membership() throws error if instruction does not exist", {
  expect_error(create_chatroom_membership(user_id = u_id,
                                          chatroom_id = c_id,
                                          instruction_id = 1))
})

test_that("create_chatroom_membership() throws error if user does not exist", {
  expect_error(create_chatroom_membership(user_id = 1,
                                          chatroom_id = c_id,
                                          instruction_id = i_id))
})

test_that("create_chatroom_membership() throws error if chatroom does not exist", {
  expect_error(create_chatroom_membership(user_id = u_id,
                                          chatroom_id = 1,
                                          instruction_id = i_id))
})

test_that("create_chatroom_membership() works", {
  out <- create_chatroom_membership(user_id = u_id,
                                    chatroom_id = c_id,
                                    instruction_id = i_id)
  expect_equal(out$status, "success")

  delete_chatroom_membership(out$content$id)

})


test_that("create_message() works", {
  out <- create_message(user_id = u_id,
                        chatroom_id = c_id,
                        content = "test")
  expect_equal(out$status, "success")

  delete_message(out$content$id)
})



test_that("create_message() throws error if chatroom does not exist", {
  expect_error(create_message(user_id = u_id,
                              chatroom_id = 1,
                              content = "test"))
})

test_that("create_message() throws error if user does not exist", {
  expect_error(create_message(user_id = 1,
                              chatroom_id = c_id,
                              content = "test"))
})

# Delete chatroom info for several tests
delete_chatroom(c_id)
delete_user(u_id)
delete_instruction(i_id)
delete_experiment(e_id)
