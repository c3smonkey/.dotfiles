package demo

fun makeUserNameUpper(user: User): String {
    return user.name.uppercase()
}

fun runChecks() {
    val user = User("1", "Neo")
    val upper = makeUserNameUpper(user)
    println(upper)
    println(greeting(user))
}
