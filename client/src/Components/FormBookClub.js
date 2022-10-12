import * as React from 'react'
import '../../css/Form.css'
import { useNavigate } from 'react-router-dom'

const FormBookClub = ({ bookclub, setCurrentBookclub, fetchUser }) => {
  let navigate = useNavigate()
  const [name, setName] = React.useState(bookclub ? bookclub.name : '')
  const [adminId, setAdminId] = React.useState(
    bookclub ? bookclub.admin.id : null
  )
  const [currentUsers, setCurrentUsers] = React.useState(
    bookclub ? bookclub.users : []
  )
  const [deleteUsers, setDeleteUsers] = React.useState([])
  const [allUsers, setAllUsers] = React.useState([])

  const [newUsers, setNewUsers] = React.useState([])
  const [errors, setErrors] = React.useState([])
  const [updated, setUpdated] = React.useState(false)
  const [loading, setLoading] = React.useState(false)

  React.useEffect(() => {
    setName(bookclub ? bookclub.name : '')
    setAdminId(bookclub ? bookclub.admin.id : null)
    setCurrentUsers(bookclub ? bookclub.users : [])

    fetch('/api/users')
    .then((response) => response.json())
    .then((data) => setAllUsers(data))
    .catch((err) => {
        console.error(err)
    })
  }, [bookclub])

  const handleSubmit = (e) => {
    e.preventDefault()
    setErrors([])
    setLoading(true)
    setUpdated(false)

    const deleteUserIds = deleteUsers ? deleteUsers.map((user) => user.id) : []
    const addUserIds = newUsers ? newUsers.map((user) => user.id) : []

    fetch(`/api/bookclubs/${bookclub.id}`, {
    method: 'PATCH',
    headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json',
    },
    body: JSON.stringify({
        name,
        admin_id: adminId,
        delete_users: deleteUserIds,
        add_users: addUserIds,
    }),

    ).then((response) => {
        setLoading(false)
        setDeleteUsers([])
        setNewUsers([])
        if (response.ok) {
            setUpdated(true)
            response.json().then((data) => {
            setCurrentBookclub(data)
            fetchUser()
            })
        } else {
            response.json().then((err) => {
            if (err.exception) {
                fetchUser()
               navigate('/profile/my-bookclubs')
            } else {
                setErrors(err.errors || [err.error])
            }
            })
        }
        })
      }

      const handleDeleteCurrentMemberClick = (user) => {
        setDeleteUsers((prevUsers) => [...prevUsers, user])
      }
    
      const handleAddCurrentMemberClick = (user) => {
        const newDeltedUsers = deleteUsers.filter((u) => u.id !== user.id)
        setDeleteUsers(newDeltedUsers)
      }
    
      let filteredOptions = () => {
        const currentUserIds = currentUsers
        ? currentUsers.map((user) => user.id)
        : []
    
        const allUserIds = allUsers ? allUsers.map((user) => user.id) : []
    
        const filteredIds = allUserIds.filter((id) => currentUserIds.includes(id))
    
        const filteredUsers =
        filteredIds.length === 0
            ? []
            : allUsers.filter((user) => !filteredIds.includes(user.id))
        return filteredUsers
    }

    return (
      <form onSubmit={handleSubmit} className='form'>
      </form>
    )
  }
  
  export default FormBookClub
