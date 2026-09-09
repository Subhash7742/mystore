import React, { useState, useEffect, useRef } from 'react';
import {
  StyleSheet,
  Text,
  View,
  TextInput,
  TouchableOpacity,
  SafeAreaView,
  StatusBar,
  Image,
  Animated,
  Easing,
  KeyboardAvoidingView,
  Platform,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';

export default function App() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [showPassword, setShowPassword] = useState(false);

  // Animation values (Puma Style Intro)
  const logoScale = useRef(new Animated.Value(0.7)).current;
  const logoOpacity = useRef(new Animated.Value(0)).current;
  const formOpacity = useRef(new Animated.Value(0)).current;
  const formTranslateY = useRef(new Animated.Value(40)).current;

  useEffect(() => {
    // Step 1: Puma style logo entrance (Fade in + Zoom)
    Animated.parallel([
      Animated.timing(logoOpacity, {
        toValue: 1,
        duration: 900,
        easing: Easing.out(Easing.ease),
        useNativeDriver: true,
      }),
      Animated.spring(logoScale, {
        toValue: 1,
        friction: 6,
        tension: 40,
        useNativeDriver: true,
      }),
    ]).start(() => {
      // Step 2: Form slides up smoothly after logo settles
      Animated.parallel([
        Animated.timing(formOpacity, {
          toValue: 1,
          duration: 600,
          useNativeDriver: true,
        }),
        Animated.timing(formTranslateY, {
          toValue: 0,
          duration: 600,
          easing: Easing.out(Easing.cubic),
          useNativeDriver: true,
        }),
      ]).start();
    });
  }, []);

  return (
    <SafeAreaView style={styles.container}>
      <StatusBar barStyle="light-content" backgroundColor="#141518" />
      <KeyboardAvoidingView
        behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
        style={styles.innerContainer}
      >
        {/* Animated Brand Header */}
        <Animated.View
          style={[
            styles.headerContainer,
            {
              opacity: logoOpacity,
              transform: [{ scale: logoScale }],
            },
          ]}
        >
          <View style={styles.logoWrapper}>
            {/* Replace URI with your lion logo PNG */}
            <Image
              source={{ uri: 'https://images.unsplash.com/photo-1614027164847-1b28caa144ee?w=400' }}
              style={styles.lionLogo}
              resizeMode="contain"
            />
          </View>
          <Text style={styles.brandTitle}>MEES</Text>
          <Text style={styles.brandTagline}>UNLEASH THE BEAST</Text>
        </Animated.View>

        {/* Animated Sliding Form */}
        <Animated.View
          style={[
            styles.formContainer,
            {
              opacity: formOpacity,
              transform: [{ translateY: formTranslateY }],
            },
          ]}
        >
          {/* Email Input */}
          <View style={styles.inputWrapper}>
            <TextInput
              style={styles.input}
              placeholder="EMAIL ADDRESS"
              placeholderTextColor="#5C5E66"
              value={email}
              onChangeText={setEmail}
              keyboardType="email-address"
              autoCapitalize="none"
            />
          </View>

          {/* Password Input */}
          <View style={styles.inputWrapper}>
            <TextInput
              style={[styles.input, { paddingRight: 45 }]}
              placeholder="PASSWORD"
              placeholderTextColor="#5C5E66"
              value={password}
              onChangeText={setPassword}
              secureTextEntry={!showPassword}
            />
            <TouchableOpacity
              style={styles.eyeIcon}
              onPress={() => setShowPassword(!showPassword)}
            >
              <Ionicons
                name={showPassword ? 'eye-outline' : 'eye-off-outline'}
                size={20}
                color="#8E8E93"
              />
            </TouchableOpacity>
          </View>

          {/* Puma Style Solid Action Button */}
          <TouchableOpacity style={styles.loginBtn} activeOpacity={0.85}>
            <Text style={styles.loginBtnText}>LOG IN</Text>
          </TouchableOpacity>

          {/* Footer Action Links */}
          <View style={styles.footerLinks}>
            <TouchableOpacity>
              <Text style={styles.footerText}>Forgot Password?</Text>
            </TouchableOpacity>
            <TouchableOpacity>
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
    backgroundColor: '#141518',
  },
  innerContainer: {
    flex: 1,
    justifyContent: 'center',
    paddingHorizontal: 28,
  },
  headerContainer: {
    alignItems: 'center',
    marginBottom: 35,
  },
  logoWrapper: {
    width: 130,
    height: 130,
    justifyContent: 'center',
    alignItems: 'center',
    shadowColor: '#E5A93C',
    shadowOffset: { width: 0, height: 0 },
    shadowOpacity: 0.9,
    shadowRadius: 20,
    elevation: 15,
  },
  lionLogo: {
    width: 120,
    height: 120,
  },
  brandTitle: {
    fontSize: 34,
    fontWeight: '900',
    color: '#ECC167',
    letterSpacing: 4,
    marginTop: 10,
    textShadowColor: 'rgba(236, 193, 103, 0.45)',
    textShadowOffset: { width: 0, height: 2 },
    textShadowRadius: 10,
  },
  brandTagline: {
    fontSize: 12,
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
    borderRadius: 12,
    backgroundColor: '#1E2126',
    borderWidth: 1.2,
    borderColor: '#32353E',
  },
  input: {
    height: 54,
    paddingHorizontal: 16,
    color: '#FFFFFF',
    fontSize: 13,
    letterSpacing: 1,
    fontWeight: '600',
  },
  eyeIcon: {
    position: 'absolute',
    right: 16,
    top: 17,
  },
  loginBtn: {
    backgroundColor: '#FFFFFF',
    height: 52,
    borderRadius: 12,
    justifyContent: 'center',
    alignItems: 'center',
    marginTop: 8,
    elevation: 4,
  },
  loginBtnText: {
    color: '#111215',
    fontWeight: '800',
    fontSize: 14,
    letterSpacing: 1.5,
  },
  footerLinks: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginTop: 22,
    paddingHorizontal: 4,
  },
  footerText: {
    color: '#C6C7CC',
    fontSize: 13,
    fontWeight: '600',
  },
});
