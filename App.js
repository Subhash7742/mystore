import React, { useState, useEffect, useRef } from 'react';
import {
  StyleSheet,
  Text,
  View,
  TextInput,
  TouchableOpacity,
  SafeAreaView,
  StatusBar,
  Animated,
  Easing,
  KeyboardAvoidingView,
  Platform,
} from 'react-native';

// Custom SVG-like Golden Lion Face Vector
const LionVector = () => (
  <View style={styles.lionIconBox}>
    <Text style={styles.lionIconText}>🦁</Text>
    <View style={styles.lionGlowRing} />
  </View>
);

export default function App() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [showPassword, setShowPassword] = useState(false);

  // Puma style entrance animations
  const logoScale = useRef(new Animated.Value(0.5)).current;
  const logoOpacity = useRef(new Animated.Value(0)).current;
  const formOpacity = useRef(new Animated.Value(0)).current;
  const formTranslateY = useRef(new Animated.Value(45)).current;

  useEffect(() => {
    // 1. Logo fades in with dynamic spring zoom
    Animated.parallel([
      Animated.timing(logoOpacity, {
        toValue: 1,
        duration: 800,
        easing: Easing.out(Easing.ease),
        useNativeDriver: true,
      }),
      Animated.spring(logoScale, {
        toValue: 1,
        friction: 5,
        tension: 40,
        useNativeDriver: true,
      }),
    ]).start(() => {
      // 2. Smoothly slide up input form
      Animated.parallel([
        Animated.timing(formOpacity, {
          toValue: 1,
          duration: 500,
          useNativeDriver: true,
        }),
        Animated.timing(formTranslateY, {
          toValue: 0,
          duration: 500,
          easing: Easing.out(Easing.quad),
          useNativeDriver: true,
        }),
      ]).start();
    });
  }, []);

  return (
    <SafeAreaView style={styles.container}>
      <StatusBar barStyle="light-content" backgroundColor="#151719" />
      <KeyboardAvoidingView
        behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
        style={styles.innerContainer}
      >
        {/* Puma Style Glowing Lion Header */}
        <Animated.View
          style={[
            styles.headerContainer,
            {
              opacity: logoOpacity,
              transform: [{ scale: logoScale }],
            },
          ]}
        >
          <LionVector />
          <Text style={styles.brandTitle}>MEES</Text>
          <Text style={styles.brandTagline}>UNLEASH THE BEAST</Text>
        </Animated.View>

        {/* Input Form with Smooth Slide Entrance */}
        <Animated.View
          style={[
            styles.formContainer,
            {
              opacity: formOpacity,
              transform: [{ translateY: formTranslateY }],
            },
          ]}
        >
          {/* Email Address */}
          <View style={styles.inputWrapper}>
            <TextInput
              style={styles.input}
              placeholder="EMAIL ADDRESS"
              placeholderTextColor="#5E6068"
              value={email}
              onChangeText={setEmail}
              keyboardType="email-address"
              autoCapitalize="none"
              autoCorrect={false}
            />
          </View>

          {/* Password with Show/Hide Eye Toggle */}
          <View style={styles.inputWrapper}>
            <TextInput
              style={[styles.input, { paddingRight: 55 }]}
              placeholder="PASSWORD"
              placeholderTextColor="#5E6068"
              value={password}
              onChangeText={setPassword}
              secureTextEntry={!showPassword}
              autoCapitalize="none"
            />
            <TouchableOpacity
              style={styles.eyeBtn}
              onPress={() => setShowPassword(!showPassword)}
              activeOpacity={0.7}
            >
              <Text style={styles.eyeIcon}>
                {showPassword ? '👁️' : '🔒'}
              </Text>
            </TouchableOpacity>
          </View>

          {/* Login Button */}
          <TouchableOpacity style={styles.loginBtn} activeOpacity={0.85}>
            <Text style={styles.loginBtnText}>LOG IN</Text>
          </TouchableOpacity>

          {/* Bottom Links */}
          <View style={styles.footerLinks}>
            <TouchableOpacity activeOpacity={0.7}>
              <Text style={styles.footerText}>Forgot Password?</Text>
            </TouchableOpacity>
            <TouchableOpacity activeOpacity={0.7}>
              <Text style={styles.footerText}>Sign Up</Text>
            </TouchableOpacity>
          </View>
        </Animated.View>
      </KeyboardAvoidingView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#151719',
  },
  innerContainer: {
    flex: 1,
    justifyContent: 'center',
    paddingHorizontal: 32,
  },
  headerContainer: {
    alignItems: 'center',
    marginBottom: 45,
  },
  lionIconBox: {
    width: 110,
    height: 110,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 8,
  },
  lionIconText: {
    fontSize: 72,
    textShadowColor: '#F5C042',
    textShadowOffset: { width: 0, height: 0 },
    textShadowRadius: 22,
  },
  lionGlowRing: {
    position: 'absolute',
    width: 90,
    height: 90,
    borderRadius: 45,
    borderWidth: 1.5,
    borderColor: 'rgba(245, 192, 66, 0.3)',
  },
  brandTitle: {
    fontSize: 34,
    fontWeight: '900',
    color: '#ECC167',
    letterSpacing: 4,
    marginTop: 6,
    textShadowColor: 'rgba(236, 193, 103, 0.45)',
    textShadowOffset: { width: 0, height: 2 },
    textShadowRadius: 10,
  },
  brandTagline: {
    fontSize: 11,
    fontWeight: '700',
    color: '#D4AF37',
    letterSpacing: 2.2,
    marginTop: 3,
  },
  formContainer: {
    width: '100%',
  },
  inputWrapper: {
    position: 'relative',
    marginBottom: 16,
    borderRadius: 10,
    backgroundColor: '#1F2227',
    borderWidth: 1.2,
    borderColor: '#373A43',
    justifyContent: 'center',
  },
  input: {
    height: 54,
    paddingHorizontal: 16,
    color: '#FFFFFF',
    fontSize: 12,
    letterSpacing: 1.2,
    fontWeight: '600',
  },
  eyeBtn: {
    position: 'absolute',
    right: 16,
    height: '100%',
    justifyContent: 'center',
  },
  eyeIcon: {
    fontSize: 16,
  },
  loginBtn: {
    backgroundColor: '#FFFFFF',
    height: 52,
    borderRadius: 10,
    justifyContent: 'center',
    alignItems: 'center',
    marginTop: 6,
    elevation: 3,
  },
  loginBtnText: {
    color: '#111215',
    fontWeight: '900',
    fontSize: 13,
    letterSpacing: 1.5,
  },
  footerLinks: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginTop: 22,
    paddingHorizontal: 2,
  },
  footerText: {
    color: '#CACBD1',
    fontSize: 12,
    fontWeight: '500',
  },
});

