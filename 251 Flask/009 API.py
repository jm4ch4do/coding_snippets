' ---------------------------- API ----------------------------- '
# It's easy to get started writing such an API with Flask. If you
# return a dict or list from a view, it will be converted to a
# JSON response.

@app.route("/me")
def me_api():
    user = get_current_user()
    return {
        "username": user.username,
        "theme": user.theme,
        "image": url_for("user_image", filename=user.image),
    }

@app.route("users/")
def users_api():
    users = get_all_users()
    return [user.to_json() for user in users]