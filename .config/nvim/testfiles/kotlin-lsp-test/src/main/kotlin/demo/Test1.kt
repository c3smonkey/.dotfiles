package demo

data class User(val id: String, var name: String)

fun greeting(user: User): String {
    return "Hello, ${user.name}"
}
