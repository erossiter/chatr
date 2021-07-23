test_that("create_experiment() works with defaults", {
  expect_equal(2 * 2, 4)
})

test_that("create_experiment() works for Spanish", {
  expect_equal(2 * 2, 4)
})

test_that("create_instruction() throws error if experiment does not exists", {
  expect_equal(2 * 2, 4)
})

test_that("create_instruction() works if experiment exists", {
  expect_equal(2 * 2, 4)
})

test_that("create_chatroom() works", {
  expect_equal(2 * 2, 4)
})

test_that("create_chatroom() throws error if chatroom name is not unique", {
  expect_equal(2 * 2, 4)
})
