using System;

class Student
{
    public string Name { get; set; }
    public int Grade1 { get; set; }
    public int Grade2 { get; set; }
    public int Grade3 {  get; set; }

    public double GetAverage() => (Grade1 + Grade2 + Grade3) / 3.0;

    public string GetLetterGrade()
    {
        double avg = GetAverage();

        if (avg >= 90) return "A";
        else if (avg >= 75) return "B";
        else if (avg >= 60) return "C";
        else return "F";
    }

    public void Print() =>
        Console.WriteLine($"{Name} | Avg: {GetAverage():F2} | Grade: {GetLetterGrade()}");
}


class BankAccount
{
    public string Owner { get; }
    public decimal Balance { get; private set; }

    public BankAccount(string owner, decimal initialDeposit)
    {
        if (initialDeposit < 0)
            throw new ArgumentException("Cannot start with negative money");

        Owner = owner;
        Balance = initialDeposit;
    }

    public void Deposit(decimal amount)
    {
        if (amount <= 0)
            throw new ArgumentException("Deposit must be positive");

        Balance += amount;
    }

    public void Withdraw(decimal amount)
    {
        if (amount <= 0)
            throw new ArgumentException("Withdraw must be positive");

        if (amount > Balance)
            throw new InvalidOperationException("Insufficient funds");

        Balance -= amount;
    }

    public void PrintStatement()
    {
        Console.WriteLine($"{Owner} | Balance: {Balance}");
    }
}

class Temperature
{
    private double _celsius;

    public double Celsius
    {
        get { return _celsius; }
        set
        {
            if (value < -273.15)
                throw new ArgumentException("Below absolute zero");

            _celsius = value;
        }
    }

    public double Fahrenheit
    {
        get { return _celsius * 9 / 5 + 32; }
        set
        {
            Celsius = (value - 32) * 5 / 9;
        }
    }

    public Temperature(double celsius)
    {
        Celsius = celsius;
    }

    public void Print()
    {
        Console.WriteLine($"{Celsius}°C / {Fahrenheit}°F");
    }
}








class Program
{
    static void Main()
    {
        //1
        Student[] roster = new Student[]
        {
            new Student { Name = "Assel", Grade1 = 90, Grade2 = 45, Grade3 = 88 },
            new Student { Name = "Aya", Grade1 = 70, Grade2 = 78, Grade3 = 72 },
            new Student { Name = "Sulu", Grade1 = 95, Grade2 = 82, Grade3 = 96 },
            new Student { Name = "Assem", Grade1 = 90, Grade2 = 65, Grade3 = 63 }
        };

        foreach (Student s in roster)
            s.Print();

        Student best = roster[0];
        foreach (Student s in roster)
        {
            if (s.GetAverage() > best.GetAverage())
                best = s;
        }

        Console.WriteLine($"\nBest student: {best.Name}");





       //2
        var acc = new BankAccount("Assel", 100m);
        acc.Deposit(50m);
        acc.Withdraw(30m);
        acc.PrintStatement();


       //3
        var temp = new Temperature(25);
        temp.Print();

        temp.Fahrenheit = 100;
        temp.Print();
    }
}