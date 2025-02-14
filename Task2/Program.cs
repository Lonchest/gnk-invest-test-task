namespace Task2;

internal class Program
{
    static void Main(string[] args)
    {
        var numbers = new List<int> { 541, 3532, 65434, 66535 };

        var res = string.Join(",", numbers);

        Console.WriteLine(res);
    }
}
