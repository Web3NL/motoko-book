import { AuthClient } from "@dfinity/auth-client"

async function login() {
  const authClient = await AuthClient.create()
  await new Promise((resolve, reject) => {
    authClient.login({
      identityProvider: "https://identity.internetcomputer.org",
      onSuccess: () => {
        const p = authClient.getIdentity().getPrincipal().toText()
        console.log(p)
        document.getElementById("principal").innerHTML = p
        resolve()
      },
      onError: reject,
    })
  })
}

async function logout() {
  const authClient = await AuthClient.create()
  await authClient.logout()
  document.getElementById("principal").innerHTML = ""
}

window.login = login
window.logout = logout
