using MetricImperial.Model;

namespace MetricImperial.Extensions
{
    public static class Extension
    {
        public static DateTime SetKindUtc(this DateTime dateTime)
        {
            if (dateTime.Kind == DateTimeKind.Utc) { return dateTime; }
            return DateTime.SpecifyKind(dateTime, DateTimeKind.Utc);
        }

        public static string SetAsteriskPassword(this string password)
        {
            return string.Concat(Enumerable.Repeat("*", password.Length*3));
        }

        public static ResponseMessage ToJsonResponse(this string response, int ResponseStatus = 200)
        {
            if (ResponseStatus == 200)
            {
                return new ResponseMessage() { Message = "Successfully", Result = response, Status = ResponseStatus };
            }
            return new ResponseMessage() { Message = "Failed", Result = response, Status = ResponseStatus };
        }
    }
}
