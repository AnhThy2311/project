
package module;

public class Customer {
    public String email;
     public String password;
     public String phone;
    public String fullName;
    public String birthDate;

    public Customer(String email, String password, String phone, String fullName, String birthDate ) {
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.fullName = fullName;
        this.birthDate = birthDate;
    }


    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }
   

  

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
