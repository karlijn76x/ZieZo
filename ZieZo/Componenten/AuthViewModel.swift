import Firebase
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var user: User?
    let db = Firestore.firestore()

    init() {
        self.user = Auth.auth().currentUser
    }

    func register(email: String, password: String, name: String, age: Int, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(error)
            } else if let result = result {
                let uid = result.user.uid
                self.db.collection("users").document(uid).setData([
                    "uid": uid,
                    "email": email,
                    "name": name,
                    "age": age
                ]) { firestoreError in
                    if let firestoreError = firestoreError {
                        completion(firestoreError)
                    } else {
                        self.user = result.user
                        completion(nil)
                    }
                }
            }
        }
    }

    func login(email: String, password: String, completion: @escaping (Error?, Int?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(error, nil)
            } else if let result = result {
                let uid = result.user.uid
                self.db.collection("users").document(uid).getDocument { snapshot, error in
                    if let error = error {
                        completion(error, nil)
                    } else if let snapshot = snapshot, let data = snapshot.data(), let age = data["age"] as? Int {
                        self.user = result.user
                        completion(nil, age)
                    } else {
                        completion(NSError(domain: "AppError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Leeftijd niet gevonden."]), nil)
                    }
                }
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
        } catch {
            print("Sign out error: \(error)")
        }
    }
}
