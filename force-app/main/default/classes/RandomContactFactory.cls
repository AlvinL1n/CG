public class RandomContactFactory 
{
    public static List<Contact> generateRandomContacts(Integer c, String last)
    {
        List<Contact> contacts=new List<Contact>();
        for(Integer i=0;i<c; i++)
        {
            Contact con=new Contact(FirstName='Test '+i, LastName=last);
            contacts.add(con);
        }
        
        return contacts;
    }

}