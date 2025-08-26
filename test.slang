module foo;
import pbr;
import scopes.view;
import scopes.frame;
import node;

void main() {
  int a;
  var a = 1; // OK, `a` is an `int`.
  var b = float3(0, 1, 2); // OK, `b` is a `float3`.
  var a : int = 1; // OK.
  var b : int; // OK.
  let a = 5; // OK, `a` is `int`.
  let b : int = 5; // OK.
}

interface IFoo
{
    int myMethod(float arg);
};

extension IFoo
{
    int bar() { return 0; }
};

int myGenericMethod<T: IFoo>(T arg)
{
    bool t = foo is MyImpl; // true
    Optional<MyImpl> optV = foo as MyImpl;
    return arg.myMethod(1.0);
}

bool myBoolMethod()
{
    return false;
}

string myStringMethod()
{
    return "Hello";
}

extension MyObject : IBar, IBar2
{
    float bar() { return 1.0f; }
    float bar2() { return 2.0f; }
};

struct MyType
{
    int val[12];
    __subscript(int x, int y) -> int
    {
        get { return val[x*3 + y]; }
        set { val[x*3+y] = newValue; }
    }
};

struct MyType
{
    int myVal;
    __init()
    {
        myVal = 10;
    }
};

struct MyType
{
    uint flag;

    property highBits : uint
    {
        get { return flag >> 16; }
        set { flag = (flag & 0xFF) + (newValue << 16); }
    }
};

interface IFoo
{
    property int count {get; set;}
};

class MyClass : IFoo
{
    int count;

    __init()
    {
        count = 0;
    }
};

extension uint : IPrintf
{
    // A `uint` only consumes one word in the variadic payload.
    //
    // Note: unlike the case for `IPrintable` above, the encoding
    // for format args for `printf()` doesn't include type information.
    //
    uint getPrintfWordCount() { return 1; }

    // Writing the required data to the payload for `printf()` is simple
    void writePrintfWords(RWStructuredBuffer<uint> buffer, uint offset)
    {
        buffer[offset++] = this;
    }
};

extension String : IPrintf
{
    uint getPrintfWordCount() { return 1; }

    void writePrintfWords(RWStructuredBuffer<uint> buffer, uint offset)
    {
        buffer[offset++] = getStringHash(this);
    }
};


namespace foo {
extension uint : IPrintf
{
    void writePrintfWords(RWStructuredBuffer<uint> buffer, uint offset)
    {
        buffer[offset++] = this;
    }
}

struct
{
    int x,y;
}
}

#ifdef __SLANG__
#define R(X) /**/
#define BEGIN_CBUFFER(NAME) cbuffer NAME
#define END_CBUFFER(NAME, REG) /**/
#define CBUFFER_REF(NAME, FIELD) FIELD
#else
#define R(X) X
#define BEGIN_CBUFFER(NAME) struct SLANG_ParameterGroup_##NAME
#define END_CBUFFER(NAME, REG) ; cbuffer NAME : register(REG) { SLANG_ParameterGroup_##NAME NAME; }
#define CBUFFER_REF(NAME, FIELD) NAME.FIELD

#define C C_0
#define a a_0
#define b b_0
#define SV_Position SV_POSITION
#endif

BEGIN_CBUFFER(C)
{
	float a;
	float b;
}
END_CBUFFER(C,b0)


float4 main() : SV_Position
{
	return (uint) CBUFFER_REF(C,a) / CBUFFER_REF(C,b);
}

__target_intrinsic(hlsl, "bar($0, $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)")
int foo(int x0, int x1, int x2, int x3, int x4, int x5, int x6, int x7, int x8, int x9, int x10, int x11);

[numthreads(1, 1, 1)]
void computeMain()
{
    foo(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11);
}

namespace NS
{
    struct MyType<let u : int, let v : int>
    {
        int arr[u /(v+1-1)];
    }
}

StructuredBuffer<NS.MyType<1, 3>> buffer;


struct VertexInput {
    float4 position : POSITION;   // Vertex position in object space
    float3 normal : NORMAL;       // Vertex normal in object space
    float2 texCoord : TEXCOORD0;  // Texture coordinates
};
