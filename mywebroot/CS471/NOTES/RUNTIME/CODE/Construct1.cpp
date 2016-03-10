using namespace std;
# include <iostream>
class C {
public:
   C();
   virtual void f() const;
   void test() const;
};
C::C()
{
  cout << "from constructor C: ";
  f();
}
void C::f() const
{
  cout << "1" << endl;
}
void C::test() const
{
  cout << "from test: ";
  f();
}
class SubC : public C 
{
public:
   SubC();
   void f() const;
};
SubC::SubC()
{
  cout << "from constructor SubC: ";
  f();
}
void SubC::f() const
{
  cout << "2" << endl;
}

int main()
{
  const C& c = C();    // output: from constructor C: 1
  const SubC& sc = SubC(); // output: from constructor C: 1
                       // output: from constructor SubC: 2
  const C& c1 = SubC();  // output: from constructor C: 1
  c.test();            // output: from constructor SubC: 2 
  sc.test();           // output: from test: 1
  c1.test();           // output: from test: 2
  return 0;            // output: from test: 2
}

/*
mimicking the following Java
public class Construct1 {
   public static void main(String[] args) {
      C c = new C();    // from constructor C: 1
      SubC sc = new SubC(); // from constructor C: 2
                        // from constructor SubC: 2
      C c1 = new SubC();  // from constructor C: 2
                        // from constructor SC: 2
      c.test();         // from test: 1
      sc.test();        // from test: 2
      c1.test();        // from test: 2
   }
}
*/

