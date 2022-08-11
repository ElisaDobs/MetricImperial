using MetricImperial.Model;
using MetricImperial.DAL;
using MetricImperial.Extensions;

namespace MetricImperial.Repository
{
    public class AccountRepository
    {
        public AccountRepository() { }

        public User? Validate(string name, string password)
        {
            using (AyoContext context = new AyoContext())
            {
                var user = context.Users.FirstOrDefault(a => a.UserName == name && a.UserPassword == password);

                if (user != null) return user;

                return default;
            }
        }

        public User CreateUser(string name, string last_name, string password)
        {
            using (AyoContext context = new AyoContext())
            {
                var user = new User()
                {
                    UserName = name,
                    UserLastName = last_name,
                    UserPassword = password,
                    DateTimeStamp = DateTime.Now.SetKindUtc()
                };
                if (context.Users.Any(a => a.UserName == name))
                {
                    throw new Exception("The username already exist in the system.");
                }
                context.Users.Add(user);
                context.SaveChanges();

                return user;
            }
        }
    }
}
