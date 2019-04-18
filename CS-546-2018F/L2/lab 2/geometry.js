function checkIsProperNumber (val, variableName) {
    if (typeof val !== "number") {
      throw `${variableName || "provided variable"} is not a number`;
    }
  
    if (isNaN(val)) {
      throw `${variableName || "provided variable"} is NaN`;
    }

    if (val <= 0) {
        throw `${variableName || "provided variable"} is not positive`;
    }
}

function volumeOfRectangularPrism (length, width, height) {
    if (arguments.length === 3) {
        checkIsProperNumber(length, "First number");
        checkIsProperNumber(width, "Second number");
        checkIsProperNumber(height, "Third number");
    } else {
        throw "Wrong number of arguments. Should be 3. We have " + arguments.length + ".";
    }

    return length * width * height;
}

function surfaceAreaOfRectangularPrism (length, width, height)  {
    if (arguments.length === 3) {
        checkIsProperNumber(length, "First number");
        checkIsProperNumber(width, "Second number");
        checkIsProperNumber(height, "Third number");
    } else {
        throw "Wrong number of arguments. Should be 3. We have " + arguments.length + ".";
    }

    return 2 * (length * width + length * height + width * height);
}

function volumeOfSphere (radius) {
    if (arguments.length === 1) {
        checkIsProperNumber(radius, "Radius");
    } else {
        throw "Wrong number of arguments. Should be 1. We have " + arguments.length + ".";
    }

    return (4.0/3.0) * Math.PI * Math.pow (radius, 3);
}

function surfaceAreaOfSphere (radius) {
    if (arguments.length === 1) {
        checkIsProperNumber(radius, "Radius");
    } else {
        throw "Wrong number of arguments. Should be 1. We have " + arguments.length + ".";
    }

    return 4 * Math.PI * Math.pow(radius, 2);
}

module.exports = {
    description: "This is a geometry calculator for cs-546-lab2.",
    volumeOfRectangularPrism,
    surfaceAreaOfRectangularPrism,
    volumeOfSphere,
    surfaceAreaOfSphere
};