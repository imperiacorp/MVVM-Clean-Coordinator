import SwiftUI

struct UserViewModel: Identifiable {
    var id: String { String(userId) }
    
    let userId: Int
    let userName: String
    let userURLString: String
    let userImageURLString: String
    
    init(githubUser: GithubUser) {
        userId = githubUser.id
        userName = githubUser.login
        userURLString = githubUser.htmlURL
        userImageURLString = githubUser.avatarURL
    }
    
    init(
        userId: Int,
        userName: String,
        userURLString: String,
        userImageURLString: String
    ) {
        self.userId = userId
        self.userName = userName
        self.userURLString = userURLString
        self.userImageURLString = userImageURLString
    }
}

struct UserView : View {
    var user: UserViewModel
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: user.userImageURLString)) { image in
                image.resizable().aspectRatio(contentMode: .fill).frame(width: 50, height: 50).clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(user.userName)
                Text(user.userURLString)
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user:
                    UserViewModel(
                        userId: 1,
                        userName: "mojombo",
                        userURLString: "https://github.com/mojombo",
                        userImageURLString: "https://avatars.githubusercontent.com/u/1?v=4"
                    )
        )
    }
}
