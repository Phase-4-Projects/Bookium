import * as React from 'react'
import { Button, TextField, Alert, Stack } from '@mui/material'
import { useNavigate } from 'react-router'

const FormSignup = ({ onLogin }) => {
    const [firstName, setFirstName] = React.useState('')
    const [lastName, setLastName] = React.useState('')
    const [email, setEmail] = React.useState('')
    const [password, setPassword] = React.useState('')
    const [passwordConfirmation, setPasswordConfirmation] = React.useState('')
    const [location, setLocation] = React.useState('')
    const [errors, setErrors] = React.useState([])
  
    let navigate = useNavigate()

  const handleSubmit = (e) => {
    e.preventDefault()
    setErrors([])
    fetch('/api/signup', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
    },
    body: JSON.stringify({
        first_name: firstName,
      last_name: lastName,
        password,
        password_confirmation: passwordConfirmation,
        email,
        location,
        profile_color: '#004d40',
    }),
    }).then((response) => {
    if (response.ok) {
        response
        .json()
        .then((user) => onLogin(user))
        .then(navigate('/'))
    } else {
        response.json().then((err) => setErrors(err.errors || [err.error]))
    }
    })
  }

  return (
    <form onSubmit={handleSubmit} className='form'> …
    </form>
  )
}

export default FormSignup
