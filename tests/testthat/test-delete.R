# Create chatroom info for several tests
e_id <- create_experiment(name = "chatr test experiment")$content$id
i_id <- create_instruction(experiment_id = e_id,
                           name = "chatr test instruction",
                           text = "test")$content$id
u_id <- create_user(username = "chatr test user")$content$id
c_id <- create_chatroom(topic = "chatr test chatroom")$content$id
cm_id <- create_chatroom_membership(user_id = u_id,
                                    chatroom_id = c_id,
                                    instruction_id = i_id)$content$id
m_id <- create_message(user_id = u_id,
                       chatroom_id = c_id,
                       content = "test")$content$id

test_that("delete_message() works", {
  out <- delete_message(m_id)
  expect_equal(out$status, "success")
})

test_that("delete_chatroom_membership() works", {
  out <- delete_chatroom_membership(cm_id)
  expect_equal(out$status, "success")
})

test_that("delete_chatroom() works", {
  out <- delete_chatroom(c_id)
  expect_equal(out$status, "success")
})

test_that("delete_user() works", {
  out <- delete_user(u_id)
  expect_equal(out$status, "success")
})

test_that("delete_instruction() works", {
  out <- delete_instruction(i_id)
  expect_equal(out$status, "success")
})

test_that("delete_experiment() works", {
  out <- delete_experiment(e_id)
  expect_equal(out$status, "success")
})


